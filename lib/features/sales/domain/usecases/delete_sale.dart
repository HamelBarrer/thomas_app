import 'package:thomas_app/core/errors/failures.dart';
import 'package:thomas_app/core/utils/either.dart';
import 'package:thomas_app/features/sales/domain/repositories/sale_repository.dart';

class DeleteSale {
  final SaleRepository repository;

  const DeleteSale({required this.repository});

  Future<Either<Failure, void>> call(int id) async {
    return await repository.deleteSale(id);
  }
}
