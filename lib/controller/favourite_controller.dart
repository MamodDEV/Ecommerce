import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/favourite_data.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  Map isFavourite = {};
  setFavourite(id, val) {
    isFavourite[id] = val;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  List data = [];
  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  String? username;
  String? id;
  String? lang;
  FavouriteData favouriteData = FavouriteData(Get.find());

  addFav(itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await favouriteData.addFavourite(
        itemsid, myServices.sharedPreferences.getString("id")!);

    print("=============================== Controller $response ");
    print('======add=======$response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.snackbar('hey', 'added');
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
  }

  removeFav(itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await favouriteData.removeFavourite(
        itemsid.toString(), myServices.sharedPreferences.getString("id")!);
    print("========trem========$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.snackbar('hey', 'removed');

        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
