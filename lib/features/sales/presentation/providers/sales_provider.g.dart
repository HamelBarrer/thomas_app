// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(saleLocalDataSource)
const saleLocalDataSourceProvider = SaleLocalDataSourceProvider._();

final class SaleLocalDataSourceProvider
    extends
        $FunctionalProvider<
          SaleLocalDataSource,
          SaleLocalDataSource,
          SaleLocalDataSource
        >
    with $Provider<SaleLocalDataSource> {
  const SaleLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'saleLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$saleLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<SaleLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SaleLocalDataSource create(Ref ref) {
    return saleLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SaleLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SaleLocalDataSource>(value),
    );
  }
}

String _$saleLocalDataSourceHash() =>
    r'0e8dc79dc85aa07e6ab16bb2404b90c20dce0c61';

@ProviderFor(saleRepository)
const saleRepositoryProvider = SaleRepositoryProvider._();

final class SaleRepositoryProvider
    extends $FunctionalProvider<SaleRepository, SaleRepository, SaleRepository>
    with $Provider<SaleRepository> {
  const SaleRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'saleRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$saleRepositoryHash();

  @$internal
  @override
  $ProviderElement<SaleRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SaleRepository create(Ref ref) {
    return saleRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SaleRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SaleRepository>(value),
    );
  }
}

String _$saleRepositoryHash() => r'8b246f0510aa395304eff42927eead3fee8357f7';

@ProviderFor(createSaleUseCase)
const createSaleUseCaseProvider = CreateSaleUseCaseProvider._();

final class CreateSaleUseCaseProvider
    extends
        $FunctionalProvider<
          CreateSaleUseCase,
          CreateSaleUseCase,
          CreateSaleUseCase
        >
    with $Provider<CreateSaleUseCase> {
  const CreateSaleUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createSaleUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createSaleUseCaseHash();

  @$internal
  @override
  $ProviderElement<CreateSaleUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateSaleUseCase create(Ref ref) {
    return createSaleUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateSaleUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateSaleUseCase>(value),
    );
  }
}

String _$createSaleUseCaseHash() => r'873f6f0378809c9ecd451023ebf13c42489efc39';

@ProviderFor(getSalesUseCase)
const getSalesUseCaseProvider = GetSalesUseCaseProvider._();

final class GetSalesUseCaseProvider
    extends
        $FunctionalProvider<GetSalesUseCase, GetSalesUseCase, GetSalesUseCase>
    with $Provider<GetSalesUseCase> {
  const GetSalesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getSalesUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getSalesUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetSalesUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetSalesUseCase create(Ref ref) {
    return getSalesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetSalesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetSalesUseCase>(value),
    );
  }
}

String _$getSalesUseCaseHash() => r'35e3994c7b65257f6476204c0d00b6cefbea1576';

@ProviderFor(updateSaleUseCase)
const updateSaleUseCaseProvider = UpdateSaleUseCaseProvider._();

final class UpdateSaleUseCaseProvider
    extends $FunctionalProvider<UpdateSale, UpdateSale, UpdateSale>
    with $Provider<UpdateSale> {
  const UpdateSaleUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateSaleUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateSaleUseCaseHash();

  @$internal
  @override
  $ProviderElement<UpdateSale> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UpdateSale create(Ref ref) {
    return updateSaleUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateSale value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateSale>(value),
    );
  }
}

String _$updateSaleUseCaseHash() => r'60552f5cdc006e0875a0d4665928a38d5d200233';

@ProviderFor(deleteSaleUseCase)
const deleteSaleUseCaseProvider = DeleteSaleUseCaseProvider._();

final class DeleteSaleUseCaseProvider
    extends $FunctionalProvider<DeleteSale, DeleteSale, DeleteSale>
    with $Provider<DeleteSale> {
  const DeleteSaleUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteSaleUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteSaleUseCaseHash();

  @$internal
  @override
  $ProviderElement<DeleteSale> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DeleteSale create(Ref ref) {
    return deleteSaleUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteSale value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteSale>(value),
    );
  }
}

String _$deleteSaleUseCaseHash() => r'176f853007f8c66ba6aca4d8c5eb2aafdc305324';

/// Provider for the search/filter query

@ProviderFor(SalesFilter)
const salesFilterProvider = SalesFilterProvider._();

/// Provider for the search/filter query
final class SalesFilterProvider extends $NotifierProvider<SalesFilter, String> {
  /// Provider for the search/filter query
  const SalesFilterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'salesFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$salesFilterHash();

  @$internal
  @override
  SalesFilter create() => SalesFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$salesFilterHash() => r'10ce8f74109f43ffa57c1f88291c613353d98923';

/// Provider for the search/filter query

abstract class _$SalesFilter extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Provider for filtered sales list

@ProviderFor(FilteredSales)
const filteredSalesProvider = FilteredSalesProvider._();

/// Provider for filtered sales list
final class FilteredSalesProvider
    extends $AsyncNotifierProvider<FilteredSales, List<Sale>> {
  /// Provider for filtered sales list
  const FilteredSalesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredSalesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredSalesHash();

  @$internal
  @override
  FilteredSales create() => FilteredSales();
}

String _$filteredSalesHash() => r'c83bf4f4b5ef8ce4be051b24f3d0b23f77d62eb1';

/// Provider for filtered sales list

abstract class _$FilteredSales extends $AsyncNotifier<List<Sale>> {
  FutureOr<List<Sale>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Sale>>, List<Sale>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Sale>>, List<Sale>>,
              AsyncValue<List<Sale>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(Sales)
const salesProvider = SalesProvider._();

final class SalesProvider extends $AsyncNotifierProvider<Sales, List<Sale>> {
  const SalesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'salesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$salesHash();

  @$internal
  @override
  Sales create() => Sales();
}

String _$salesHash() => r'05f66ae99cbc0f6168873950e1cb18fac5e13470';

abstract class _$Sales extends $AsyncNotifier<List<Sale>> {
  FutureOr<List<Sale>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Sale>>, List<Sale>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Sale>>, List<Sale>>,
              AsyncValue<List<Sale>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
