import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nbu_api/data/modles/currency/currency_model.dart';
import 'package:nbu_api/data/modles/my_response/my_response.dart';
import 'package:nbu_api/data/repository/get_currency/get_currency.dart';
import 'package:nbu_api/service/get_it/get_it.dart';

part 'currency_event.dart';

part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc() : super(const CurrencyState()){
    on<CurrencyEventGetAllCurrency>(_getAllCurrency);
  }

  Future<void> _getAllCurrency(
      CurrencyEventGetAllCurrency event, Emitter<CurrencyState> emit) async {
    emit(
      state.copyWith(
        status: CurrencyStatus.loading,
      ),
    );
    MyResponse myResponse = await getIt<CurrencyRepository>().getAllCurrency();
    if (myResponse.error.isEmpty) {
      emit(
        state.copyWith(
          status: CurrencyStatus.success,
          currencyList: myResponse.data,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: CurrencyStatus.error,
          errorText: myResponse.error,
        ),
      );
    }
  }
}
