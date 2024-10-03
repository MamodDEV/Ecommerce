import 'dart:ui';
import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:ecommerce/core/functions/fcmconfig.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? language;
  ThemeData? appTheme;
  MyServices myServices = Get.find<MyServices>();
  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString('lang', langcode);
    appTheme = langcode == 'ar' ? themeArabic : themeEnglish;
    Get.updateLocale(locale);
  }

  requestLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      Get.snackbar('Alert', "Give Location Permissions !");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        Get.snackbar('Alert', "Give Location Permissions !");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar('Alert',
          "Give Location Permissions OR you won't be able to use the app !");
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
  }

  @override
  void onInit() {
    requestPermissionNotification();
    fcmConfig();
    requestLocation();
    String? sharedPrefLang = myServices.sharedPreferences.getString('lang');
    if (sharedPrefLang == 'ar') {
      language = const Locale('ar');
      appTheme = themeArabic;
    } else if (sharedPrefLang == 'en') {
      appTheme = themeEnglish;
      language = const Locale('en');
    } else {
      appTheme = themeEnglish;
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
