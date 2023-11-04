class CurrencyModel {
  CurrencyModel({
    required this.title,
    required this.code,
    required this.cbPrice,
    required this.nbuBuyPrice,
    required this.nbuCellPrice,
    required this.date,
  });

  String title;
  String code;
  String cbPrice;
  String nbuBuyPrice;
  String nbuCellPrice;
  String date;

  factory CurrencyModel.fromJson(Map<String, dynamic> jsonData) {
    return CurrencyModel(
      title: jsonData['title'] as String? ?? '',
      code: jsonData['code'] as String? ?? '',
      cbPrice: jsonData['cb_price'] as String? ?? '',
      nbuBuyPrice: jsonData['nbu_buy_price'] as String? ?? '0.000',
      nbuCellPrice: jsonData['nbu_cell_price'] as String? ?? '0.000',
      date: jsonData['date'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['code'] = code;
    map['cb_price'] = cbPrice;
    map['nbu_buy_price'] = nbuBuyPrice;
    map['nbu_cell_price'] = nbuCellPrice;
    map['date'] = date;
    return map;
  }
}
