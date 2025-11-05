import 'package:thomas_app/core/errors/failures.dart';
import 'package:thomas_app/core/utils/either.dart';
import 'package:thomas_app/features/products/domain/entities/product.dart';
import 'package:thomas_app/features/products/domain/repositories/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository repository;

  const GetProductsUseCase({required this.repository});

  Future<Either<Failure, List<Product>>> call() {
    return repository.getProducts();
  }
}
