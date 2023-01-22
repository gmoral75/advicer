import 'package:advicer/0_data/datasources/advice_remote_datasource.dart';
import 'package:advicer/1_domain/entities/advice_entity.dart';
import 'package:advicer/1_domain/failures/failures.dart';
import 'package:advicer/1_domain/repositories/advice_repo.dart';
import 'package:dartz/dartz.dart';

class AdviceRepoImpl implements AdviceRepo {
  final AdviceRemoteDatasource adviceRemoteDatasource =
      AdviceRemoteDatasourceImpl();

  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDatasource() async {
    final result = await adviceRemoteDatasource.getRandomAdviceFromApi();
    return right(result);
  }
}
