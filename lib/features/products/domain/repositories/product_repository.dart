import 'package:thomas_app/core/errors/failures.dart';
import 'package:thomas_app/core/utils/either.dart';
import 'package:thomas_app/features/products/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();
  Future<Either<Failure, Product>> getProductById(int id);
}
