import 'dart:io';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Function(bool)? alertExitApp() {
  Get.defaultDialog(
    title: "Alert",
    middleText: "Do you want to exit the app ?",
    confirm: const Text('Yes'),
    confirmTextColor: AppColor.darkprimary,
    cancelTextColor: AppColor.grey,
    onCancel: () {
      Get.back();
    },
    onConfirm: () {
      exit(0);
    },
    cancel: const Text('No'),
  );
  return null;
}
