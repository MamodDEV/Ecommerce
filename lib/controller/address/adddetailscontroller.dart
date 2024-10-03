import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/address_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddAddressDetailsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  String? lat;
  String? long;
  TextEditingController? city;
  TextEditingController? name;
  TextEditingController? street;
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();
  addDetails() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addAddress(
        myServices.sharedPreferences.getString('id')!,
        name!.text,
        city!.text,
        street!.text,
        lat.toString(),
        long.toString());
    print("================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRoute.homePage);
        Get.snackbar('Added Successfully', "You can use this address to order");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    city = TextEditingController();
    name = TextEditingController();
    street = TextEditingController();
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    print(lat);
    print(long);
    super.onInit();
  }
}
