import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/items_data.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends SearchMixController {
  initialData();
  changeCat(int val, int catid);
  getItems(catid);
  goToProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int? selectedCat;
  List data = [];
  String? id;
  late StatusRequest statusRequest = StatusRequest.none;
  ItemsData itemsData = ItemsData(Get.find());
  MyServices myServices = Get.find();
  int? catid;
  @override
  void onInit() {
    initialData();

    super.onInit();
  }

  @override
  initialData() {
    search = TextEditingController();

    catid = Get.arguments['catid'];
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    id = myServices.sharedPreferences.getString("id");

    getItems(catid);
  }

  @override
  changeCat(val, catid) {
    selectedCat = val;
    getItems(catid);
    update();
  }

  @override
  getItems(catid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData((catid!).toString(), id!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {"itemsmodel": itemsModel});
  }
}
