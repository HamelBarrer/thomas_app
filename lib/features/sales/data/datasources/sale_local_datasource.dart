import 'package:thomas_app/core/database/database_helper.dart';
import 'package:thomas_app/core/errors/exceptions.dart';
import 'package:thomas_app/features/sales/data/models/sale_model.dart';

abstract class SaleLocalDataSource {
  Future<void> createSale(SaleModel sale);
  Future<List<SaleModel>> getAllSales();
  Future<List<SaleModel>> getSalesByClient(String clientName);
  Future<void> updateSale(SaleModel sale);
  Future<void> deleteSale(int id);
}

class SaleLocalDataSourceImpl implements SaleLocalDataSource {
  final DatabaseHelper dbHelper;

  const SaleLocalDataSourceImpl({required this.dbHelper});

  @override
  Future<void> createSale(SaleModel sale) async {
    try {
      final db = await dbHelper.database;
      await db.insert('sales', sale.toJson());
    } catch (e, stackTrace) {
      throw CacheException(
        message: 'Failed to create sale: $e',
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<List<SaleModel>> getAllSales() async {
    try {
      final db = await dbHelper.database;
      final maps = await db.query('sales', orderBy: 'sale_date DESC');
      return maps.map((map) => SaleModel.fromJson(map)).toList();
    } catch (e, stackTrace) {
      throw CacheException(
        message: 'Failed to get sales: $e',
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<List<SaleModel>> getSalesByClient(String clientName) async {
    try {
      final db = await dbHelper.database;
      final maps = await db.query(
        'sales',
        where: 'client_name LIKE ?',
        whereArgs: ['%$clientName%'],
        orderBy: 'sale_date DESC',
      );
      return maps.map((map) => SaleModel.fromJson(map)).toList();
    } catch (e, stackTrace) {
      throw CacheException(
        message: 'Failed to get sales by client: $e',
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> updateSale(SaleModel sale) async {
    try {
      final db = await dbHelper.database;
      await db.update(
        'sales',
        sale.toJson(),
        where: 'id = ?',
        whereArgs: [sale.id],
      );
    } catch (e, stackTrace) {
      throw CacheException(
        message: 'Failed to update sale: $e',
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> deleteSale(int id) async {
    try {
      final db = await dbHelper.database;
      await db.delete('sales', where: 'id = ?', whereArgs: [id]);
    } catch (e, stackTrace) {
      throw CacheException(
        message: 'Failed to delete sale: $e',
        stackTrace: stackTrace,
      );
    }
  }
}
