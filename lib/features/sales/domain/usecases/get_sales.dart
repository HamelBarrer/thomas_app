import 'package:thomas_app/core/errors/failures.dart';
import 'package:thomas_app/core/utils/either.dart';
import 'package:thomas_app/features/sales/domain/entities/sale.dart';
import 'package:thomas_app/features/sales/domain/repositories/sale_repository.dart';

class GetSalesUseCase {
  final SaleRepository repository;

  const GetSalesUseCase({required this.repository});

  Future<Either<Failure, List<Sale>>> call() {
    return repository.getAllSales();
  }
}
