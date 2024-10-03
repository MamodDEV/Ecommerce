import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/cart_data.dart';
import 'package:ecommerce/data/model/cartmodel.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailController extends GetxController {
  goToCart();
}

class ProductDetailControllerImp extends ProductDetailController {
  // CartController cartController = Get.put(CartController());
  int countitem = 0;
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  late ItemsModel itemsModel;
  List<CartModel> data = [];
  int prodcount = 0;
  List subitems = [
    {
      "name": "Red",
      "id": 1,
      "active": 1,
    },
    {
      "name": "Blue",
      "id": 2,
      "active": 0,
    },
    {
      "name": "Black",
      "id": 3,
      "active": 0,
    }
  ];
  add() {
    additems(itemsModel.itemsId);
    countitem++;
    update();
  }

  additems(
    itemid,
  ) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        itemid, myServices.sharedPreferences.getString('id'));

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.snackbar('Alert', 'Added To Cart',
            duration: const Duration(milliseconds: 500),
            backgroundColor: AppColor.white,
            mainButton: TextButton(
              child: const Text('view'),
              onPressed: () {
                Get.offNamed(AppRoute.items);
              },
            ));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  delete() {
    if (countitem > 0) {
      deleteitems(itemsModel.itemsId);
      countitem--;

      update();
    }
  }

  deleteitems(itemsid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.deleteCart(
        itemsid.toString(), myServices.sharedPreferences.getString("id")!);
    print("========trem========$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.snackbar('Alert', 'Removed From Cart',
            duration: const Duration(milliseconds: 500),
            backgroundColor: AppColor.white,
            mainButton: TextButton(
                child: const Text('view'),
                onPressed: () {
                  Get.offNamed(AppRoute.items);
                }));

        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getCount(itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountCart(
        itemsid.toString(), myServices.sharedPreferences.getString("id")!);
    print("========trem========$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        print(response['data']);
        countitem = int.parse(response['data']['countitem'].toString());

        return countitem;
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  intialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    print('asdfdsfsdfa|||${itemsModel.itemsDiscount}');
    countitem = await getCount(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  void onInit() async {
    intialData();
    super.onInit();
  }

  @override
  goToCart() {
    Get.toNamed(AppRoute.cart);
    update();
  }
}
