part of 'currency_bloc.dart';

class CurrencyState extends Equatable {
  const CurrencyState({
    this.status = CurrencyStatus.initial,
    this.currencyList = const <CurrencyModel>[],
    this.errorText = "",
  });

  final CurrencyStatus status;
  final List<CurrencyModel> currencyList;
  final String errorText;

  CurrencyState copyWith({
    CurrencyStatus? status,
    List<CurrencyModel>? currencyList,
    String? errorText,
  }) {
    return CurrencyState(
      status: status ?? this.status,
      currencyList: currencyList ?? this.currencyList,
      errorText: errorText ?? this.errorText,
    );
  }

  @override
  List<Object> get props => [
    status,
    currencyList,
    errorText,
  ];
}

enum CurrencyStatus { initial, success, error, loading }

extension CurrencyStatusX on CurrencyStatus {
  bool get isInitial => this == CurrencyStatus.initial;

  bool get isSuccess => this == CurrencyStatus.success;

  bool get isError => this == CurrencyStatus.error;

  bool get isLoading => this == CurrencyStatus.loading;
}
