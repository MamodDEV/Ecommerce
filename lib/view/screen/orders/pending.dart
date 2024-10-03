import 'package:ecommerce/controller/orders/pendingcontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/orders/orderList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingOrders extends StatelessWidget {
  const PendingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => PendingOrderController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Orders'),
        ),
        body: GetBuilder<PendingOrderController>(builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              margin: const EdgeInsets.only(top: 15, left: 5, right: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: Get.width / 2.1,
                        decoration: BoxDecoration(
                            color: controller.i == 0
                                ? AppColor.price
                                : AppColor.grey,
                            borderRadius: BorderRadius.circular(30)),
                        child: TextButton(
                            onPressed: () {
                              controller.changePage("pending");
                            },
                            child: const Text(
                              "Pending",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            )),
                      ),
                      Container(
                        width: Get.width / 2.1,
                        decoration: BoxDecoration(
                            color: controller.i != 0
                                ? AppColor.price
                                : AppColor.grey,
                            borderRadius: BorderRadius.circular(30)),
                        child: TextButton(
                            onPressed: () {
                              controller.changePage("archive");
                            },
                            child: const Text(
                              "Archived",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            )),
                      ),
                    ],
                  ),
                  RefreshIndicator(
                    onRefresh: () async => controller.onRefresh(),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: controller.i == 0
                              ? OrderList(
                                  length: controller.pendingorders.length,
                                  order: controller.pendingorders,
                                )
                              : OrderList(
                                  length: controller.archivedorders.length,
                                  order: controller.archivedorders,
                                ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
