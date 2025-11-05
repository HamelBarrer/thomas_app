import 'package:flutter_test/flutter_test.dart';
import 'package:thomas_app/features/products/domain/entities/product.dart';

void main() {
  group('Product Entity', () {
    test('should create a Product instance with required fields', () {
      const product = Product(
        id: 1,
        title: 'Test Product',
        price: 99.99,
        description: 'Test Description',
        category: 'electronics',
        image: 'https://test.com/image.jpg',
      );

      expect(product.id, 1);
      expect(product.title, 'Test Product');
      expect(product.price, 99.99);
      expect(product.description, 'Test Description');
      expect(product.category, 'electronics');
      expect(product.image, 'https://test.com/image.jpg');
      expect(product.rating, null);
    });

    test('should create a Product with rating', () {
      const rating = Rating(rate: 4.5, count: 100);
      const product = Product(
        id: 1,
        title: 'Test Product',
        price: 99.99,
        description: 'Test Description',
        category: 'electronics',
        image: 'https://test.com/image.jpg',
        rating: rating,
      );

      expect(product.rating, isNotNull);
      expect(product.rating?.rate, 4.5);
      expect(product.rating?.count, 100);
    });
  });

  group('Rating Entity', () {
    test('should create a Rating instance', () {
      const rating = Rating(rate: 4.5, count: 100);

      expect(rating.rate, 4.5);
      expect(rating.count, 100);
    });
  });
}
