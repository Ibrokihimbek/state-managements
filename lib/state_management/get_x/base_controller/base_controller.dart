import 'package:flutter/material.dart';
import 'package:get/get.dart';

export 'package:get/get.dart';

abstract class BaseController extends GetxController {
  RxBool isLoading = false.obs;

  void setLoading(bool value) {
    isLoading.value = value;
  }

  void showErrorMessage(String message, {Duration? duration}) {
    Get.snackbar(
      'error',
      duration: duration,
      message,
      backgroundColor: Colors.red,
      borderRadius: 8,
      colorText: Colors.red,
      maxWidth: Get.width,
      margin: const EdgeInsets.all(12),
    );
  }
}

