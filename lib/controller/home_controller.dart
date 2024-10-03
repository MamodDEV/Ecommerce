import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/home_data.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends SearchMixController {
  initialData();
  getData();
  goToItems(List categories, int selectedCat, int categoryid);
}

class HomeControllerImp extends HomeController {
  // List data = [];
  List categories = [];
  List items = [];
  List settings = [];
  MyServices myServices = Get.find();
  String? username;
  String? id;
  String? lang;
  String? cardtitle = '';
  String? cardbody = '';
  @override
  initialData() {
    search = TextEditingController();
    username = myServices.sharedPreferences.getString('username');
    id = myServices.sharedPreferences.getString("id")!;
    lang = myServices.sharedPreferences.getString('lang');
  }

  @override
  getData() async {
    print('again');
    try {
      statusRequest = StatusRequest.loading;
      var response = await homeData.getData();
      print("================${response['status']}");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          categories.addAll(response['categories']['data']);
          items.addAll(response['items']['data']);
          settings.addAll(response['settings']['data']);
          cardtitle = settings[0]['settings_title'];
          cardbody = settings[0]['settings_body'];
          print(settings);
          print(settings[0]['settings_title']);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    } catch (e) {
      Get.defaultDialog(
          title: "Error to fetch data , check your internet and try again",
          titleStyle: const TextStyle(fontSize: 16),
          middleText: "Details :$e",
          confirm: TextButton(
              onPressed: () {
                getData();
                Get.back();
              },
              child: const Text('Try Again')));
    }
    ;
    update();
  }

  goToNotification() {
    Get.toNamed(AppRoute.notifications);
  }

  @override
  void onInit() {
    getData();
    initialData();
    super.onInit();
  }

  goToProductDetails(itemsModel) {
    print(itemsModel);
    Get.toNamed(AppRoute.productdetails, arguments: {"itemsmodel": itemsModel});
    update();
  }

  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      'selectedCat': selectedCat,
      'catid': categoryid
    });
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

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
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
