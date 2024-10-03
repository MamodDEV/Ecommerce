import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/data/datasource/remote/home_data.dart';
import 'package:ecommerce/data/datasource/remote/offers_data.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OffersController extends SearchMixController {
  OffersData offersData = OffersData(Get.find());
  List<ItemsModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await offersData.getData();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List datares = response['data'];
        data.addAll(datares.map((e) => ItemsModel.fromJson(e)));
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {"itemsmodel": itemsModel});
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }
}

class SearchMixController extends GetxController {
  late TextEditingController search;
  List<ItemsModel> listsearch = [];
  bool isSearch = false;
  HomeData homeData = HomeData(Get.find());

  late StatusRequest statusRequest = StatusRequest.none;

  onChangeSearch(String val) {
    statusRequest = StatusRequest.none;
    if (val == "") {
      isSearch = false;
    }
    update();
  }

  onPressedSearch() {
    isSearch = true;
    searchData();
    update();
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search.text);

    print("================${response['status']}");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        print("==========200======${response['status']}");

        listsearch.clear();
        List responsebody = response['data'];
        listsearch.addAll(responsebody.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
