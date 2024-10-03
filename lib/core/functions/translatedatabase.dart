import 'package:ecommerce/core/services/services.dart';
import 'package:get/get.dart';

translateDB(columnar, columnen) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString('lang') == 'en') {
    return columnen;
  } else {
    return columnar;
  }
}
