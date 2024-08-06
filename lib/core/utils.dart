import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showMessage(String title, message) {
  Get.defaultDialog(
    title: title,
    content: Text(
      message,
    ),
  );
}

void showWarning(String message) {
  showMessage('Aviso', message);
}

void showError(String message) {
  showMessage('Erro', message);
}
