import 'package:nbu_api/data/modles/my_response/my_response.dart';
import 'package:nbu_api/service/api_service/api_service.dart';
import 'package:nbu_api/service/get_it/get_it.dart';

class CurrencyRepository {
  Future<MyResponse> getAllCurrency() async =>
      await getIt<ApiService>().getAllCurrency();
}