import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/myfavourite_data.dart';
import 'package:ecommerce/data/model/myfavourite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavouriteController extends GetxController {
  List<MyFavouriteModel> data = [];
  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  String? username;
  String? id;
  String? lang;
  MyFavouriteData favouriteData = MyFavouriteData(Get.find());
  late TextEditingController search;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favouriteData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    print('======add=======$response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => MyFavouriteModel.fromJson(e)));
        print(data);
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deletefromfavourite(String favid) {
    // statusRequest = StatusRequest.loading;
    var response = favouriteData.delete(favid);
    print("=============================== Controller $response ");
    print('======add=======$response');
    data.removeWhere((element) => element.favouriteId.toString() == favid);
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();

    getData();
    super.onInit();
  }
}
