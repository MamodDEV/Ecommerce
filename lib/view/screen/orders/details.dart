import 'package:ecommerce/controller/orders/detailscontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailsOrder extends StatelessWidget {
  const DetailsOrder({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: GetBuilder<DetailsController>(
            builder: (controller) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    Card(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Column(
                          children: [
                            Table(
                              border: TableBorder.all(),
                              children: [
                                const TableRow(children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Item',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.darkprimary,
                                          fontSize: 15),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'QTY',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.darkprimary,
                                          fontSize: 15),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Price',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.darkprimary,
                                          fontSize: 15),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Discount',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.darkprimary,
                                          fontSize: 15),
                                    ),
                                  ),
                                ]),
                                ...List.generate(
                                  controller.data.length,
                                  (index) {
                                    return TableRow(children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '${controller.data[index].itemsName}',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '${controller.data[index].countitems}',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: AppColor.darkprimary,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '${controller.data[index].itemsPrice}\$',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: AppColor.darkprimary,
                                              fontSize: 14),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '${controller.data[index].itemsDiscount}\$',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: AppColor.darkprimary,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ]);
                                  },
                                ),
                              ],
                            ),
                            Center(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Shipping Fees : ${controller.ordermodel!.ordersPricedelivery}\$',
                                  style: const TextStyle(color: AppColor.price),
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Total Price : ${controller.ordermodel!.ordersTotalprice}\$',
                                  style: const TextStyle(color: AppColor.price),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (controller.ordermodel!.ordersType == 0)
                      Card(
                        child: Center(
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: ListTile(
                                title: const Text(
                                  'Shipping Address',
                                  style: TextStyle(
                                      color: AppColor.darkprimary,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                    '${controller.ordermodel!.addressStreet}'),
                              )),
                        ),
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (controller.ordermodel!.ordersType == 0)
                      Card(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 300,
                          width: double.infinity,
                          child: GoogleMap(
                            markers: controller.markers.toSet(),
                            mapType: MapType.normal,
                            initialCameraPosition: controller.cameraPosition!,
                            onMapCreated: (GoogleMapController mapController) {
                              controller.completercontroller!
                                  .complete(mapController);
                            },
                          ),
                        ),
                      )
                  ],
                ),
              );
            },
          )),
    );
  }
}
