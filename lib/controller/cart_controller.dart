import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/cart_data.dart';
import 'package:ecommerce/data/model/cartmodel.dart';
import 'package:ecommerce/data/model/couponmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  TextEditingController? couponcontroller;
  CartData cartData = CartData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  double orderprice = 0.0;
  int totalcount = 0;
  String? couponname;
  String? couponid;
  int prodcount = 0;
  int? discountcoupon = 0;
  List<CartModel> data = [];
  CouponModel? couponModel;
  add(
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

  delete(itemsid) async {
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

  resetCartVar() {
    data.clear();
    totalcount = 0;
    orderprice = 0.0;
  }

  refreshPage() {
    resetCartVar();
    view();
    update();
  }

  view() async {
    statusRequest = StatusRequest.loading;

    update();
    data.clear();

    var response =
        await cartData.viewCart(myServices.sharedPreferences.getString("id"));
    print("========trem========$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success') {
          List dataresponse = response['datacart']['data'];
          Map datacountprice = response['countprice'];
          data.clear();

          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalcount = int.parse(datacountprice['totalcount']);
          orderprice = double.parse(datacountprice['totalprice'].toString());
          prodcount = totalcount;
        }
        if (response['datacart']['status'] == 'failure') {
          statusRequest = StatusRequest.failure;
          update();
        }
        // data.addAll(response['data']);w
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    if (data.isEmpty) {
      statusRequest = StatusRequest.failure;
      update();
      return Get.snackbar(
          "Can't Apply Coupon", "Add some items And try again !");
    }
    var response = await cartData.checkCoupon(couponcontroller!.text);
    print("========trem========$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Map<String, dynamic> dataCoupon = response['data'];
        couponModel = CouponModel.fromJson(dataCoupon);
        discountcoupon = couponModel!.couponDiscount!;
        couponname = couponModel!.couponName;
        couponid = couponModel!.couponId.toString();
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.none;
        discountcoupon = 0;
        couponname = null;
        Get.defaultDialog(
          middleText: "coupon not available or may be expired",
          cancel: null,
        );
      }
    }
    update();
  }

  getFinalPrice() {
    return orderprice.round() -
        (orderprice.round() * discountcoupon! / 100).round();
  }

  goToCheckout() {
    if (data.isEmpty) {
      return Get.snackbar('Alert', "Cart is Empty , add some products ");
    }
    Get.toNamed(AppRoute.checkout, arguments: {
      "couponid": couponid ?? "0",
      "priceorder": orderprice.toString(),
      "discountcoupon": discountcoupon.toString(),
    });
  }

  @override
  void onInit() async {
    couponcontroller = TextEditingController();
    await view(); // TODO: implement onInit
    super.onInit();
  }
}
