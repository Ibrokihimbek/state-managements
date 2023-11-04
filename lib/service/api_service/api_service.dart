import 'package:dio/dio.dart';
import 'package:nbu_api/data/modles/currency/currency_model.dart';
import 'package:nbu_api/data/modles/my_response/my_response.dart';
import 'package:nbu_api/service/api_client/api_client.dart';

class ApiService extends ApiClient {
  Future<MyResponse> getAllCurrency() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get(
        dio.options.baseUrl
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        List json = response.data as List;
        myResponse.data = json.map((e) => CurrencyModel.fromJson(e)).toList();
      }
    } catch (err) {
      myResponse.error = err.toString();
    }
    return myResponse;
  }
}