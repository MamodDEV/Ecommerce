import 'dart:async';

import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;

  Completer<GoogleMapController>? completercontroller;
  CameraPosition? kGooglePlex;

  Position? position;
  double? lat;
  double? long;
  List<Marker> markers = [];
  addTomarker(LatLng latlong) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId('1'), position: latlong));
    lat = latlong.latitude;
    long = latlong.longitude;
    update();
  }

  goToAddDetails() {
    Get.toNamed(
      AppRoute.addressadddetails,
      arguments: {'lat': lat.toString(), 'long': long.toString()},
    );
    statusRequest = StatusRequest.none;
    update();
  }

  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
        target: (LatLng(position!.latitude, position!.longitude)),
        zoom: 12.4747);
    addTomarker(LatLng(position!.latitude, position!.longitude));
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    getCurrentLocation();
    completercontroller = Completer<GoogleMapController>();

    super.onInit();
  }
}
