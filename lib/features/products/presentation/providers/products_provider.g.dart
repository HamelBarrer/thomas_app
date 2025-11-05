// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(productRemoteDataSource)
const productRemoteDataSourceProvider = ProductRemoteDataSourceProvider._();

final class ProductRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ProductRemoteDataSource,
          ProductRemoteDataSource,
          ProductRemoteDataSource
        >
    with $Provider<ProductRemoteDataSource> {
  const ProductRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ProductRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProductRemoteDataSource create(Ref ref) {
    return productRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductRemoteDataSource>(value),
    );
  }
}

String _$productRemoteDataSourceHash() =>
    r'99e378aefe4b0e0778ed7ba8fc9adc577f6e0b42';

@ProviderFor(productRepository)
const productRepositoryProvider = ProductRepositoryProvider._();

final class ProductRepositoryProvider
    extends
        $FunctionalProvider<
          ProductRepository,
          ProductRepository,
          ProductRepository
        >
    with $Provider<ProductRepository> {
  const ProductRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productRepositoryHash();

  @$internal
  @override
  $ProviderElement<ProductRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProductRepository create(Ref ref) {
    return productRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductRepository>(value),
    );
  }
}

String _$productRepositoryHash() => r'b0e23715948b09c6cf33b4c906552136ce07ffce';

@ProviderFor(getProductsUseCase)
const getProductsUseCaseProvider = GetProductsUseCaseProvider._();

final class GetProductsUseCaseProvider
    extends
        $FunctionalProvider<
          GetProductsUseCase,
          GetProductsUseCase,
          GetProductsUseCase
        >
    with $Provider<GetProductsUseCase> {
  const GetProductsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getProductsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getProductsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetProductsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetProductsUseCase create(Ref ref) {
    return getProductsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetProductsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetProductsUseCase>(value),
    );
  }
}

String _$getProductsUseCaseHash() =>
    r'39a33fbf3e1539e0cfe9c95a50abb37b2e2e84a5';

@ProviderFor(getProductDetailUseCase)
const getProductDetailUseCaseProvider = GetProductDetailUseCaseProvider._();

final class GetProductDetailUseCaseProvider
    extends
        $FunctionalProvider<
          GetProductDetailUseCase,
          GetProductDetailUseCase,
          GetProductDetailUseCase
        >
    with $Provider<GetProductDetailUseCase> {
  const GetProductDetailUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getProductDetailUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getProductDetailUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetProductDetailUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetProductDetailUseCase create(Ref ref) {
    return getProductDetailUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetProductDetailUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetProductDetailUseCase>(value),
    );
  }
}

String _$getProductDetailUseCaseHash() =>
    r'c97ad803c41695646b379e798b3cb414bfd6663b';

@ProviderFor(Products)
const productsProvider = ProductsProvider._();

final class ProductsProvider
    extends $AsyncNotifierProvider<Products, List<Product>> {
  const ProductsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsHash();

  @$internal
  @override
  Products create() => Products();
}

String _$productsHash() => r'63256e9c0d3b756f1585b0334cd28b8f767a4027';

abstract class _$Products extends $AsyncNotifier<List<Product>> {
  FutureOr<List<Product>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Product>>, List<Product>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Product>>, List<Product>>,
              AsyncValue<List<Product>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ProductDetail)
const productDetailProvider = ProductDetailFamily._();

final class ProductDetailProvider
    extends $AsyncNotifierProvider<ProductDetail, Product> {
  const ProductDetailProvider._({
    required ProductDetailFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'productDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productDetailHash();

  @override
  String toString() {
    return r'productDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProductDetail create() => ProductDetail();

  @override
  bool operator ==(Object other) {
    return other is ProductDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productDetailHash() => r'03ff10a430588dea85ce7eb133ebc94e2d6a9831';

final class ProductDetailFamily extends $Family
    with
        $ClassFamilyOverride<
          ProductDetail,
          AsyncValue<Product>,
          Product,
          FutureOr<Product>,
          int
        > {
  const ProductDetailFamily._()
    : super(
        retry: null,
        name: r'productDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProductDetailProvider call(int productId) =>
      ProductDetailProvider._(argument: productId, from: this);

  @override
  String toString() => r'productDetailProvider';
}

abstract class _$ProductDetail extends $AsyncNotifier<Product> {
  late final _$args = ref.$arg as int;
  int get productId => _$args;

  FutureOr<Product> build(int productId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<Product>, Product>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Product>, Product>,
              AsyncValue<Product>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(selectedProduct)
const selectedProductProvider = SelectedProductFamily._();

final class SelectedProductProvider
    extends $FunctionalProvider<Product?, Product?, Product?>
    with $Provider<Product?> {
  const SelectedProductProvider._({
    required SelectedProductFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'selectedProductProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$selectedProductHash();

  @override
  String toString() {
    return r'selectedProductProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Product?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Product? create(Ref ref) {
    final argument = this.argument as int;
    return selectedProduct(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Product? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Product?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedProductProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$selectedProductHash() => r'd4e88b11a655cc30fa18fb4da22bd01dcda654ef';

final class SelectedProductFamily extends $Family
    with $FunctionalFamilyOverride<Product?, int> {
  const SelectedProductFamily._()
    : super(
        retry: null,
        name: r'selectedProductProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SelectedProductProvider call(int productId) =>
      SelectedProductProvider._(argument: productId, from: this);

  @override
  String toString() => r'selectedProductProvider';
}
