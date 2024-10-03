import 'dart:async';

import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/data/datasource/remote/orders/detailsorder.dart';
import 'package:ecommerce/data/model/cartmodel.dart';
import 'package:ecommerce/data/model/ordersmodel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailsController extends GetxController {
  Completer<GoogleMapController>? completercontroller;
  CameraPosition? cameraPosition;
  OrdersModel? ordermodel;
  Position? position;
  double? lat;
  double? long;
  List<Marker> markers = [];

  DetailsOrderData detailsOrderData = DetailsOrderData(Get.find());
  List<CartModel> data = [];
  late StatusRequest statusRequest = StatusRequest.none;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response =
        await detailsOrderData.getData(ordermodel!.ordersId.toString());
    print("================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CartModel.fromJson(e)));
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  initialData() {
    if (ordermodel!.ordersType == 0) {
      cameraPosition = CameraPosition(
          target: (LatLng(ordermodel!.addressLat!, ordermodel!.addressLong!)),
          zoom: 18.4747);
      markers.add(Marker(
          markerId: const MarkerId('1'),
          position: LatLng(ordermodel!.addressLat!, ordermodel!.addressLong!)));
    }
  }

  @override
  void onInit() {
    ordermodel = Get.arguments['model'];
    completercontroller = Completer<GoogleMapController>();
    initialData();
    getData();
    super.onInit();
  }
}
