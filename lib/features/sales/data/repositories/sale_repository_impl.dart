import 'package:thomas_app/core/errors/exceptions.dart';
import 'package:thomas_app/core/errors/failures.dart';
import 'package:thomas_app/core/utils/either.dart';
import 'package:thomas_app/features/sales/data/datasources/sale_local_datasource.dart';
import 'package:thomas_app/features/sales/data/models/sale_model.dart';
import 'package:thomas_app/features/sales/domain/entities/sale.dart';
import 'package:thomas_app/features/sales/domain/repositories/sale_repository.dart';

class SaleRepositoryImpl implements SaleRepository {
  final SaleLocalDataSource localDataSource;

  const SaleRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, void>> createSale(Sale sale) async {
    try {
      final saleModel = SaleModel(
        clientName: sale.clientName,
        productId: sale.productId,
        productTitle: sale.productTitle,
        productImage: sale.productImage,
        quantity: sale.quantity,
        unitPrice: sale.unitPrice,
        totalPrice: sale.totalPrice,
        saleDate: sale.saleDate,
      );
      await localDataSource.createSale(saleModel);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } on Exception catch (e) {
      return Left(UnexpectedFailure(message: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Sale>>> getAllSales() async {
    try {
      final sales = await localDataSource.getAllSales();
      return Right(sales);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } on Exception catch (e) {
      return Left(UnexpectedFailure(message: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Sale>>> getSalesByClient(
    String clientName,
  ) async {
    try {
      final sales = await localDataSource.getSalesByClient(clientName);
      return Right(sales);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } on Exception catch (e) {
      return Left(UnexpectedFailure(message: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateSale(Sale sale) async {
    try {
      final saleModel = SaleModel(
        id: sale.id,
        clientName: sale.clientName,
        productId: sale.productId,
        productTitle: sale.productTitle,
        productImage: sale.productImage,
        quantity: sale.quantity,
        unitPrice: sale.unitPrice,
        totalPrice: sale.totalPrice,
        saleDate: sale.saleDate,
      );
      await localDataSource.updateSale(saleModel);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } on Exception catch (e) {
      return Left(UnexpectedFailure(message: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteSale(int id) async {
    try {
      await localDataSource.deleteSale(id);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } on Exception catch (e) {
      return Left(UnexpectedFailure(message: 'Unexpected error: $e'));
    }
  }
}
