import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/address_data.dart';
import 'package:ecommerce/data/model/addressview.dart';
import 'package:get/get.dart';

class AddressViewController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  AddressData addressData = AddressData(Get.find());
  List<AddressViewModel> data = [];
  MyServices myServices = Get.find();
  viewAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData
        .viewAddress(myServices.sharedPreferences.getString('id')!);
    print("================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List responsebody = response['data'];
        data.addAll(responsebody.map((e) => AddressViewModel.fromJson(e)));
        if (data.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToEdit(int i) {
    myServices.sharedPreferences
        .setString('editaddressid', data[i].addressId!.toString());
    Get.toNamed(AppRoute.addressedit);
  }

  deleteAddress(String addressid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.deleteAddress(addressid);
    print("================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        data.removeWhere(
            (element) => element.addressId.toString() == addressid);
        Get.snackbar("Address Deleted", "Done !");
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    viewAddress(); // TODO: implement onInit
    super.onInit();
  }
}
