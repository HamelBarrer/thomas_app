import 'package:flutter_test/flutter_test.dart';
import 'package:thomas_app/features/sales/domain/entities/sale.dart';

void main() {
  group('Sale Entity', () {
    final testDate = DateTime(2024, 1, 15);

    test('should create a Sale instance without id (for new sales)', () {
      final sale = Sale(
        clientName: 'John Doe',
        productId: 1,
        productTitle: 'Test Product',
        productImage: 'https://test.com/image.jpg',
        quantity: 2,
        unitPrice: 99.99,
        totalPrice: 199.98,
        saleDate: testDate,
      );

      expect(sale.id, null);
      expect(sale.clientName, 'John Doe');
      expect(sale.productId, 1);
      expect(sale.productTitle, 'Test Product');
      expect(sale.productImage, 'https://test.com/image.jpg');
      expect(sale.quantity, 2);
      expect(sale.unitPrice, 99.99);
      expect(sale.totalPrice, 199.98);
      expect(sale.saleDate, testDate);
    });

    test('should create a Sale instance with id (for existing sales)', () {
      final sale = Sale(
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

      expect(sale.id, 1);
      expect(sale.clientName, 'John Doe');
    });

    test('should calculate correct total price', () {
      final sale = Sale(
        clientName: 'John Doe',
        productId: 1,
        productTitle: 'Test Product',
        productImage: 'https://test.com/image.jpg',
        quantity: 3,
        unitPrice: 50.00,
        totalPrice: 150.00,
        saleDate: testDate,
      );

      expect(sale.totalPrice, sale.quantity * sale.unitPrice);
    });
  });
}
