import 'package:nbu_api/data/modles/currency/currency_model.dart';
import 'package:nbu_api/data/modles/my_response/my_response.dart';
import 'package:nbu_api/data/repository/get_currency/get_currency.dart';
import 'package:nbu_api/service/get_it/get_it.dart';
import 'package:nbu_api/state_management/get_x/base_controller/base_controller.dart';

class CurrencyController extends BaseController {

  CurrencyController();

  @override
  void onInit() {
    super.onInit();
    getCurrency();
    update();
  }

  List<CurrencyModel> _currencyData = [];
  String _errorText = '';

  Future<void> getCurrency() async {
    setLoading(true);
    MyResponse myResponse = await getIt<CurrencyRepository>().getAllCurrency();
    if (myResponse.error.isEmpty) {
      _currencyData = myResponse.data;
    } else {
      _errorText = myResponse.error;
    }
    setLoading(false);
    update();
  }

  List<CurrencyModel> get currencyList => _currencyData;

  String get errorText => _errorText;
}

