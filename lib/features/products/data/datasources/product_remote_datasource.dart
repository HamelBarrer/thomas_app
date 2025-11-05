import 'package:dio/dio.dart';
import 'package:thomas_app/core/errors/exceptions.dart';
import 'package:thomas_app/features/products/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
  Future<ProductModel> getProductById(int id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio;

  const ProductRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dio.get('/products');

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data as List<dynamic>;
        return jsonList
            .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw ServerException(
          message: 'Failed to load products: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw ServerException(
        message: e.message ?? 'Network error occurred',
        stackTrace: e.stackTrace,
      );
    } catch (e, stackTrace) {
      throw ServerException(
        message: 'Unexpected error: $e',
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<ProductModel> getProductById(int id) async {
    try {
      final response = await dio.get('/products/$id');

      if (response.statusCode == 200) {
        return ProductModel.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw ServerException(
          message: 'Failed to load product: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw ServerException(
        message: e.message ?? 'Network error occurred',
        stackTrace: e.stackTrace,
      );
    } catch (e, stackTrace) {
      throw ServerException(
        message: 'Unexpected error: $e',
        stackTrace: stackTrace,
      );
    }
  }
}
