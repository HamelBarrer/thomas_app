import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thomas_app/core/di/injection.dart';
import 'package:thomas_app/features/products/data/datasources/product_remote_datasource.dart';
import 'package:thomas_app/features/products/data/repositories/product_repository_impl.dart';
import 'package:thomas_app/features/products/domain/entities/product.dart';
import 'package:thomas_app/features/products/domain/repositories/product_repository.dart';
import 'package:thomas_app/features/products/domain/usecases/get_product_detail.dart';
import 'package:thomas_app/features/products/domain/usecases/get_products.dart';

part 'products_provider.g.dart';

@riverpod
ProductRemoteDataSource productRemoteDataSource(Ref ref) {
  return ProductRemoteDataSourceImpl(dio: ref.watch(dioProvider));
}

@riverpod
ProductRepository productRepository(Ref ref) {
  return ProductRepositoryImpl(
    remoteDataSource: ref.watch(productRemoteDataSourceProvider),
  );
}

@riverpod
GetProductsUseCase getProductsUseCase(Ref ref) {
  return GetProductsUseCase(repository: ref.watch(productRepositoryProvider));
}

@riverpod
GetProductDetailUseCase getProductDetailUseCase(Ref ref) {
  return GetProductDetailUseCase(
    repository: ref.watch(productRepositoryProvider),
  );
}

@riverpod
class Products extends _$Products {
  @override
  Future<List<Product>> build() async {
    final useCase = ref.watch(getProductsUseCaseProvider);
    final result = await useCase.call();

    return result.fold(
      (failure) => throw Exception(failure.message),
      (products) => products,
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final useCase = ref.read(getProductsUseCaseProvider);
    final result = await useCase.call();

    state = result.fold(
      (failure) =>
          AsyncValue.error(Exception(failure.message), StackTrace.current),
      (products) => AsyncValue.data(products),
    );
  }
}

@riverpod
class ProductDetail extends _$ProductDetail {
  @override
  Future<Product> build(int productId) async {
    final useCase = ref.watch(getProductDetailUseCaseProvider);
    final result = await useCase.call(productId);

    return result.fold(
      (failure) => throw Exception(failure.message),
      (product) => product,
    );
  }
}

@riverpod
Product? selectedProduct(Ref ref, int productId) {
  final productsAsync = ref.watch(productsProvider);

  return productsAsync.when(
    data: (products) {
      try {
        return products.firstWhere((p) => p.id == productId);
      } on Exception {
        return null;
      }
    },
    loading: () => null,
    error: (error, stackTrace) => null,
  );
}
