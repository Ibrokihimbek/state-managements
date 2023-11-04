part of 'currency_bloc.dart';

abstract class CurrencyEvent extends Equatable {
  const CurrencyEvent();
}

class CurrencyEventGetAllCurrency extends CurrencyEvent {
  const CurrencyEventGetAllCurrency();
  @override
  List<Object> get props => [];
}
