import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/address_data.dart';
import 'package:ecommerce/data/datasource/remote/checkout_data.dart';
import 'package:ecommerce/data/model/addressview.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  CheckoutData checkoutData = CheckoutData(Get.find());
  AddressData addressData = AddressData(Get.find());
  String? paymentMethod;
  String? deliveryMethod;
  String? addressid = "0";
  late String couponid;
  late String priceorder;
  late String discountcoupon;
  MyServices myServices = Get.find();
  List<AddressViewModel> dataAddress = [];
  changePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  changeDeliveryMethod(String val) {
    deliveryMethod = val;
    update();
  }

  changeShippingAddress(String val) {
    addressid = val;
    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("Error", "Please Select a Payment Method ");
    }
    if (deliveryMethod == null) {
      return Get.snackbar("Error", "Please Select a Delivery Method ");
    }
    if (addressid == '0') {
      return Get.snackbar("Error", "Please Add a Shipping Address ");
    }
    Map data = {
      "userid": myServices.sharedPreferences.getString("id"),
      "addressid": addressid.toString(),
      "type": deliveryMethod.toString(),
      "pricedelivery": "10",
      "price": priceorder,
      "coupon": couponid,
      "discountcoupon": discountcoupon,
      "paymentmethod": paymentMethod.toString(),
    };
    statusRequest = StatusRequest.loading;
    update();
    var response = await checkoutData.checkout(data);
    print("================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRoute.homePage);
        Get.snackbar("Success", "Order was submitted successfully!");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Error", "Something went wrong please try again");
      }
    }
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData
        .viewAddress(myServices.sharedPreferences.getString('id')!);
    print("================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List datalist = response['data'];
        dataAddress.addAll(datalist.map((e) => AddressViewModel.fromJson(e)));
        addressid = dataAddress[0].addressId.toString();
      } else {
        statusRequest = StatusRequest.none;
      }
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorder = Get.arguments['priceorder'];
    discountcoupon = Get.arguments['discountcoupon'].toString();
    getShippingAddress();
    super.onInit();
  }
}
