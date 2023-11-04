import 'package:flutter/material.dart';
import 'package:nbu_api/data/modles/currency/currency_model.dart';
import 'package:nbu_api/data/modles/my_response/my_response.dart';
import 'package:nbu_api/data/repository/get_currency/get_currency.dart';
import 'package:nbu_api/service/get_it/get_it.dart';

class CurrencyViewModel extends ChangeNotifier {
  CurrencyViewModel(){
    fetchCardsInfo();
  }

  bool isLoading = false;
  List<CurrencyModel> currencyData = [];
  String errorText = '';

  fetchCardsInfo() async {
    notify(true);
    MyResponse myResponse = await getIt<CurrencyRepository>().getAllCurrency();
    if (myResponse.error.isEmpty) {
      currencyData = myResponse.data;
    } else {
      errorText = myResponse.error;
    }
    notify(false);
  }

  notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
