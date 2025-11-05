import 'package:thomas_app/core/errors/failures.dart';
import 'package:thomas_app/core/utils/either.dart';
import 'package:thomas_app/features/sales/domain/entities/sale.dart';
import 'package:thomas_app/features/sales/domain/repositories/sale_repository.dart';

class CreateSaleUseCase {
  final SaleRepository repository;

  const CreateSaleUseCase({required this.repository});

  Future<Either<Failure, void>> call(Sale sale) {
    return repository.createSale(sale);
  }
}
