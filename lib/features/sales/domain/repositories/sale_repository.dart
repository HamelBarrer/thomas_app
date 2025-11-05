import 'package:thomas_app/core/errors/failures.dart';
import 'package:thomas_app/core/utils/either.dart';
import 'package:thomas_app/features/sales/domain/entities/sale.dart';

abstract class SaleRepository {
  Future<Either<Failure, void>> createSale(Sale sale);
  Future<Either<Failure, List<Sale>>> getAllSales();
  Future<Either<Failure, List<Sale>>> getSalesByClient(String clientName);
  Future<Either<Failure, void>> updateSale(Sale sale);
  Future<Either<Failure, void>> deleteSale(int id);
}
