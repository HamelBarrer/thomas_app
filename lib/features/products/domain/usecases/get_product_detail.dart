import 'package:thomas_app/core/errors/failures.dart';
import 'package:thomas_app/core/utils/either.dart';
import 'package:thomas_app/features/products/domain/entities/product.dart';
import 'package:thomas_app/features/products/domain/repositories/product_repository.dart';

class GetProductDetailUseCase {
  final ProductRepository repository;

  const GetProductDetailUseCase({required this.repository});

  Future<Either<Failure, Product>> call(int productId) {
    return repository.getProductById(productId);
  }
}
