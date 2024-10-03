import 'package:ecommerce/controller/notificationcontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => NotificationController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Notifications"),
        ),
        body: GetBuilder<NotificationController>(builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.fromBorderSide(
                            BorderSide(color: AppColor.darkprimary, width: 3))),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Stack(children: [
                      ListTile(
                        leading:
                            const Icon(Icons.notifications_active_outlined),
                        title: Text(
                          "${controller.notification[index].notificationTitle}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "${controller.notification[index].notificationBody}",
                        ),
                        trailing: const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [],
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 15,
                        child: Text(
                          Jiffy.parse(controller
                                  .notification[index].notificationDatetime!)
                              .fromNow(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColor.darkprimary),
                        ),
                      ),
                    ]),
                  );
                },
                itemCount: controller.notification.length,
              ),
            ),
          );
        }));
  }
}
