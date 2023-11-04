import 'package:get_it/get_it.dart';
import 'package:nbu_api/data/repository/get_currency/get_currency.dart';
import 'package:nbu_api/service/api_service/api_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => ApiService());
  getIt.registerLazySingleton(() => CurrencyRepository());
}
