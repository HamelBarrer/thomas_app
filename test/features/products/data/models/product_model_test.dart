import 'package:flutter_test/flutter_test.dart';
import 'package:thomas_app/features/products/data/models/product_model.dart';

void main() {
  group('ProductModel', () {
    const testProductModel = ProductModel(
      id: 1,
      title: 'Test Product',
      price: 99.99,
      description: 'Test Description',
      category: 'electronics',
      image: 'https://test.com/image.jpg',
    );

    test('should be a subclass of Product entity', () {
      expect(testProductModel, isA<ProductModel>());
    });

    test('should return a valid model from JSON', () {
      final Map<String, dynamic> jsonMap = {
        'id': 1,
        'title': 'Test Product',
        'price': 99.99,
        'description': 'Test Description',
        'category': 'electronics',
        'image': 'https://test.com/image.jpg',
      };

      final result = ProductModel.fromJson(jsonMap);

      expect(result.id, 1);
      expect(result.title, 'Test Product');
      expect(result.price, 99.99);
      expect(result.description, 'Test Description');
      expect(result.category, 'electronics');
      expect(result.image, 'https://test.com/image.jpg');
    });

    test('should return a valid model from JSON with rating', () {
      final Map<String, dynamic> jsonMap = {
        'id': 1,
        'title': 'Test Product',
        'price': 99.99,
        'description': 'Test Description',
        'category': 'electronics',
        'image': 'https://test.com/image.jpg',
        'rating': {'rate': 4.5, 'count': 100},
      };

      final result = ProductModel.fromJson(jsonMap);

      expect(result.rating, isNotNull);
      expect(result.rating?.rate, 4.5);
      expect(result.rating?.count, 100);
    });

    test('should return a JSON map containing proper data', () {
      final result = testProductModel.toJson();

      final expectedMap = {
        'id': 1,
        'title': 'Test Product',
        'price': 99.99,
        'description': 'Test Description',
        'category': 'electronics',
        'image': 'https://test.com/image.jpg',
      };

      expect(result, expectedMap);
    });

    test('should handle price as int from JSON', () {
      final Map<String, dynamic> jsonMap = {
        'id': 1,
        'title': 'Test Product',
        'price': 100,
        'description': 'Test Description',
        'category': 'electronics',
        'image': 'https://test.com/image.jpg',
      };

      final result = ProductModel.fromJson(jsonMap);

      expect(result.price, 100.0);
    });
  });

  group('RatingModel', () {
    test('should return a valid model from JSON', () {
      final Map<String, dynamic> jsonMap = {'rate': 4.5, 'count': 100};

      final result = RatingModel.fromJson(jsonMap);

      expect(result.rate, 4.5);
      expect(result.count, 100);
    });

    test('should return a JSON map containing proper data', () {
      const rating = RatingModel(rate: 4.5, count: 100);

      final result = rating.toJson();

      final expectedMap = {'rate': 4.5, 'count': 100};

      expect(result, expectedMap);
    });
  });
}
