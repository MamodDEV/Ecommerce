import 'package:ecommerce/controller/address/addcontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.white),
        title: const Text(
          'Add Address',
          style: TextStyle(color: AppColor.white),
        ),
      ),
      body: GetBuilder<AddAddressController>(
          builder: (controllerpage) => HandlingDataView(
                statusRequest: controllerpage.statusRequest,
                widget: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (controllerpage.kGooglePlex != null)
                      Positioned(
                        child: GoogleMap(
                          markers: controllerpage.markers.toSet(),
                          onTap: (latlong) {
                            controllerpage.addTomarker(latlong);
                          },
                          mapType: MapType.normal,
                          initialCameraPosition: controllerpage.kGooglePlex!,
                          onMapCreated: (GoogleMapController mapController) {
                            controllerpage.completercontroller!
                                .complete(mapController);
                          },
                        ),
                      ),
                    Positioned(
                      bottom: 10,
                      child: Container(
                        alignment: Alignment.center,
                        child: MaterialButton(
                          minWidth: 200,
                          color: AppColor.darkprimary,
                          textColor: AppColor.white,
                          onPressed: () {
                            controllerpage.goToAddDetails();
                          },
                          child: Text('Continue'),
                        ),
                      ),
                    )
                  ],
                ),
              )),
    );
  }
}
