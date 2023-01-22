import 'package:advicer/0_data/datasources/advice_remote_datasource.dart';
import 'package:advicer/0_data/repositories/advice_repo_impl.dart';
import 'package:advicer/1_domain/usecases/advice_usecases.dart';
import 'package:advicer/2_aplication/pages/advice/cubit/advice_cubit.dart';
import 'package:get_it/get_it.dart';
import '1_domain/repositories/advice_repo.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.I; // sl = Service Locator

Future<void> init() async {
  // ! Application Layer
  // Factory = every time a new instance of that class
  sl.registerFactory(() => AdviceCubit(adviceUseCases: sl()));

  // ! Domain Layer
  sl.registerFactory(() => AdviceUseCases(adviceRepo: sl()));

  // ! Data Layer
  sl.registerFactory<AdviceRepo>(
      () => AdviceRepoImpl(adviceRemoteDatasource: sl()));
  sl.registerFactory<AdviceRemoteDatasource>(
      () => AdviceRemoteDatasourceImpl(client: sl()));

  // ! Externs
  sl.registerFactory(() => http.Client());
}
