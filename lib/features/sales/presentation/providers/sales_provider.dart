import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thomas_app/core/di/injection.dart';
import 'package:thomas_app/features/sales/data/datasources/sale_local_datasource.dart';
import 'package:thomas_app/features/sales/data/repositories/sale_repository_impl.dart';
import 'package:thomas_app/features/sales/domain/entities/sale.dart';
import 'package:thomas_app/features/sales/domain/repositories/sale_repository.dart';
import 'package:thomas_app/features/sales/domain/usecases/create_sale.dart';
import 'package:thomas_app/features/sales/domain/usecases/delete_sale.dart';
import 'package:thomas_app/features/sales/domain/usecases/get_sales.dart';
import 'package:thomas_app/features/sales/domain/usecases/update_sale.dart';

part 'sales_provider.g.dart';

@riverpod
SaleLocalDataSource saleLocalDataSource(Ref ref) {
  return SaleLocalDataSourceImpl(dbHelper: ref.watch(databaseHelperProvider));
}

@riverpod
SaleRepository saleRepository(Ref ref) {
  return SaleRepositoryImpl(
    localDataSource: ref.watch(saleLocalDataSourceProvider),
  );
}

@riverpod
CreateSaleUseCase createSaleUseCase(Ref ref) {
  return CreateSaleUseCase(repository: ref.watch(saleRepositoryProvider));
}

@riverpod
GetSalesUseCase getSalesUseCase(Ref ref) {
  return GetSalesUseCase(repository: ref.watch(saleRepositoryProvider));
}

@riverpod
UpdateSale updateSaleUseCase(Ref ref) {
  return UpdateSale(repository: ref.watch(saleRepositoryProvider));
}

@riverpod
DeleteSale deleteSaleUseCase(Ref ref) {
  return DeleteSale(repository: ref.watch(saleRepositoryProvider));
}

@riverpod
class SalesFilter extends _$SalesFilter {
  @override
  String build() => '';

  void setFilter(String query) {
    state = query;
  }

  void clearFilter() {
    state = '';
  }
}

@riverpod
class FilteredSales extends _$FilteredSales {
  @override
  Future<List<Sale>> build() async {
    final salesAsync = await ref.watch(salesProvider.future);
    final filter = ref.watch(salesFilterProvider);

    if (filter.isEmpty) {
      return salesAsync;
    }

    final query = filter.toLowerCase();
    return salesAsync.where((sale) {
      final productTitle = sale.productTitle.toLowerCase();
      final clientName = sale.clientName.toLowerCase();
      return productTitle.contains(query) || clientName.contains(query);
    }).toList();
  }
}

@riverpod
class Sales extends _$Sales {
  @override
  Future<List<Sale>> build() async {
    final useCase = ref.watch(getSalesUseCaseProvider);
    final result = await useCase.call();

    return result.fold(
      (failure) => throw Exception(failure.message),
      (sales) => sales,
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final useCase = ref.read(getSalesUseCaseProvider);
    final result = await useCase.call();

    state = result.fold(
      (failure) =>
          AsyncValue.error(Exception(failure.message), StackTrace.current),
      (sales) => AsyncValue.data(sales),
    );
  }

  Future<bool> createSale(Sale sale) async {
    try {
      final useCase = ref.read(createSaleUseCaseProvider);
      final result = await useCase.call(sale);

      return result.fold(
        (failure) {
          if (ref.mounted) {
            state = AsyncValue.error(
              Exception(failure.message),
              StackTrace.current,
            );
          }
          return false;
        },
        (_) {
          if (ref.mounted) {
            ref.invalidateSelf();
          }
          return true;
        },
      );
    } on Exception catch (e, stackTrace) {
      if (ref.mounted) {
        state = AsyncValue.error(e, stackTrace);
      }
      return false;
    }
  }

  Future<bool> updateSale(Sale sale) async {
    try {
      final useCase = ref.read(updateSaleUseCaseProvider);
      final result = await useCase.call(sale);

      return result.fold(
        (failure) {
          if (ref.mounted) {
            state = AsyncValue.error(
              Exception(failure.message),
              StackTrace.current,
            );
          }
          return false;
        },
        (_) {
          if (ref.mounted) {
            ref.invalidateSelf();
          }
          return true;
        },
      );
    } on Exception catch (e, stackTrace) {
      if (ref.mounted) {
        state = AsyncValue.error(e, stackTrace);
      }
      return false;
    }
  }

  Future<bool> deleteSale(int id) async {
    try {
      final useCase = ref.read(deleteSaleUseCaseProvider);
      final result = await useCase.call(id);

      return result.fold(
        (failure) {
          if (ref.mounted) {
            state = AsyncValue.error(
              Exception(failure.message),
              StackTrace.current,
            );
          }
          return false;
        },
        (_) {
          if (ref.mounted) {
            ref.invalidateSelf();
          }
          return true;
        },
      );
    } on Exception catch (e, stackTrace) {
      if (ref.mounted) {
        state = AsyncValue.error(e, stackTrace);
      }
      return false;
    }
  }
}
