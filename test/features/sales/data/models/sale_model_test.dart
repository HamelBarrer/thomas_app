import 'package:flutter_test/flutter_test.dart';
import 'package:thomas_app/features/sales/data/models/sale_model.dart';

void main() {
  group('SaleModel', () {
    final testDate = DateTime(2024, 1, 15);
    final testSaleModel = SaleModel(
      id: 1,
      clientName: 'John Doe',
      productId: 1,
      productTitle: 'Test Product',
      productImage: 'https://test.com/image.jpg',
      quantity: 2,
      unitPrice: 99.99,
      totalPrice: 199.98,
      saleDate: testDate,
    );

    test('should be a subclass of Sale entity', () {
      expect(testSaleModel, isA<SaleModel>());
    });

    test('should return a valid model from JSON (Map)', () {
      final Map<String, dynamic> jsonMap = {
        'id': 1,
        'client_name': 'John Doe',
        'product_id': 1,
        'product_title': 'Test Product',
        'product_image': 'https://test.com/image.jpg',
        'quantity': 2,
        'unit_price': 99.99,
        'total_price': 199.98,
        'sale_date': '2024-01-15T00:00:00.000',
      };

      final result = SaleModel.fromJson(jsonMap);

      expect(result.id, 1);
      expect(result.clientName, 'John Doe');
      expect(result.productId, 1);
      expect(result.productTitle, 'Test Product');
      expect(result.productImage, 'https://test.com/image.jpg');
      expect(result.quantity, 2);
      expect(result.unitPrice, 99.99);
      expect(result.totalPrice, 199.98);
      expect(result.saleDate, testDate);
    });

    test('should return a JSON map containing proper data', () {
      final result = testSaleModel.toJson();

      expect(result['id'], 1);
      expect(result['client_name'], 'John Doe');
      expect(result['product_id'], 1);
      expect(result['product_title'], 'Test Product');
      expect(result['product_image'], 'https://test.com/image.jpg');
      expect(result['quantity'], 2);
      expect(result['unit_price'], 99.99);
      expect(result['total_price'], 199.98);
      expect(result['sale_date'], testDate.toIso8601String());
    });

    test('should convert to entity correctly', () {
      final entity = testSaleModel;

      expect(entity.id, testSaleModel.id);
      expect(entity.clientName, testSaleModel.clientName);
      expect(entity.productId, testSaleModel.productId);
    });
  });
}
