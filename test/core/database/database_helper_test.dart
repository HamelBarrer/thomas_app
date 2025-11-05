import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:thomas_app/core/database/database_helper.dart';
import 'package:thomas_app/features/sales/data/datasources/sale_local_datasource.dart';
import 'package:thomas_app/features/sales/data/models/sale_model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  group('DatabaseHelper & Sales CRUD Operations', () {
    late DatabaseHelper dbHelper;
    late SaleLocalDataSourceImpl dataSource;

    setUp(() async {
      dbHelper = DatabaseHelper.instance;
      dataSource = SaleLocalDataSourceImpl(dbHelper: dbHelper);
      await dbHelper.deleteDb();
    });

    tearDown(() async {
      await dbHelper.deleteDb();
    });

    test('should create database with sales table', () async {
      final db = await dbHelper.database;
      final tables = await db.query(
        'sqlite_master',
        where: 'type = ? AND name = ?',
        whereArgs: ['table', 'sales'],
      );

      expect(tables.length, 1);
      expect(tables.first['name'], 'sales');
    });

    test('should insert a sale successfully', () async {
      final sale = SaleModel(
        clientName: 'John Doe',
        productId: 1,
        productTitle: 'Test Product',
        productImage: 'https://example.com/image.jpg',
        quantity: 2,
        unitPrice: 50.0,
        totalPrice: 100.0,
        saleDate: DateTime.now(),
      );

      await dataSource.createSale(sale);

      final sales = await dataSource.getAllSales();
      expect(sales.length, 1);
      expect(sales.first.clientName, 'John Doe');
      expect(sales.first.quantity, 2);
      expect(sales.first.unitPrice, 50.0);
      expect(sales.first.totalPrice, 100.0);
    });

    test('should retrieve all sales ordered by date DESC', () async {
      final sale1 = SaleModel(
        clientName: 'Client A',
        productId: 1,
        productTitle: 'Product A',
        productImage: 'https://example.com/a.jpg',
        quantity: 1,
        unitPrice: 10.0,
        totalPrice: 10.0,
        saleDate: DateTime(2025, 1, 1),
      );

      final sale2 = SaleModel(
        clientName: 'Client B',
        productId: 2,
        productTitle: 'Product B',
        productImage: 'https://example.com/b.jpg',
        quantity: 2,
        unitPrice: 20.0,
        totalPrice: 40.0,
        saleDate: DateTime(2025, 1, 2),
      );

      await dataSource.createSale(sale1);
      await dataSource.createSale(sale2);

      final sales = await dataSource.getAllSales();
      expect(sales.length, 2);
      expect(sales.first.clientName, 'Client B');
      expect(sales.last.clientName, 'Client A');
    });

    test('should search sales by client name', () async {
      final sale1 = SaleModel(
        clientName: 'John Smith',
        productId: 1,
        productTitle: 'Product 1',
        productImage: 'https://example.com/1.jpg',
        quantity: 1,
        unitPrice: 10.0,
        totalPrice: 10.0,
        saleDate: DateTime.now(),
      );

      final sale2 = SaleModel(
        clientName: 'Jane Doe',
        productId: 2,
        productTitle: 'Product 2',
        productImage: 'https://example.com/2.jpg',
        quantity: 2,
        unitPrice: 20.0,
        totalPrice: 40.0,
        saleDate: DateTime.now(),
      );

      await dataSource.createSale(sale1);
      await dataSource.createSale(sale2);

      final results = await dataSource.getSalesByClient('john');
      expect(results.length, 1);
      expect(results.first.clientName, 'John Smith');
    });

    test('should update a sale successfully', () async {
      final sale = SaleModel(
        clientName: 'Original Client',
        productId: 1,
        productTitle: 'Original Product',
        productImage: 'https://example.com/original.jpg',
        quantity: 1,
        unitPrice: 10.0,
        totalPrice: 10.0,
        saleDate: DateTime.now(),
      );

      await dataSource.createSale(sale);
      final created = await dataSource.getAllSales();
      final createdId = created.first.id!;

      final updatedSale = SaleModel(
        id: createdId,
        clientName: 'Updated Client',
        productId: 1,
        productTitle: 'Updated Product',
        productImage: 'https://example.com/updated.jpg',
        quantity: 3,
        unitPrice: 15.0,
        totalPrice: 45.0,
        saleDate: DateTime.now(),
      );

      await dataSource.updateSale(updatedSale);

      final updated = await dataSource.getAllSales();
      expect(updated.length, 1);
      expect(updated.first.clientName, 'Updated Client');
      expect(updated.first.quantity, 3);
      expect(updated.first.totalPrice, 45.0);
    });

    test('should delete a sale successfully', () async {
      final sale = SaleModel(
        clientName: 'Test Client',
        productId: 1,
        productTitle: 'Test Product',
        productImage: 'https://example.com/test.jpg',
        quantity: 1,
        unitPrice: 10.0,
        totalPrice: 10.0,
        saleDate: DateTime.now(),
      );

      await dataSource.createSale(sale);
      final created = await dataSource.getAllSales();
      expect(created.length, 1);

      await dataSource.deleteSale(created.first.id!);

      final remaining = await dataSource.getAllSales();
      expect(remaining.length, 0);
    });

    test('should handle multiple sales correctly', () async {
      final sales = List.generate(
        5,
        (index) => SaleModel(
          clientName: 'Client $index',
          productId: index,
          productTitle: 'Product $index',
          productImage: 'https://example.com/$index.jpg',
          quantity: index + 1,
          unitPrice: (index + 1) * 10.0,
          totalPrice: (index + 1) * (index + 1) * 10.0,
          saleDate: DateTime.now().subtract(Duration(days: index)),
        ),
      );

      for (final sale in sales) {
        await dataSource.createSale(sale);
      }

      final allSales = await dataSource.getAllSales();
      expect(allSales.length, 5);

      final firstSale = allSales.first;
      expect(firstSale.clientName, 'Client 0');
    });

    test('should persist data after database reopen', () async {
      final sale = SaleModel(
        clientName: 'Persistent Client',
        productId: 1,
        productTitle: 'Persistent Product',
        productImage: 'https://example.com/persistent.jpg',
        quantity: 1,
        unitPrice: 100.0,
        totalPrice: 100.0,
        saleDate: DateTime.now(),
      );

      await dataSource.createSale(sale);
      await dbHelper.close();

      final newDataSource = SaleLocalDataSourceImpl(dbHelper: dbHelper);
      final sales = await newDataSource.getAllSales();

      expect(sales.length, 1);
      expect(sales.first.clientName, 'Persistent Client');
    });
  });
}
