import 'package:get/get.dart';
import 'package:nbu_api/state_management/get_x/currency_controller/currency_controller.dart';

class CurrencyBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut(() => CurrencyController());
  }
}

