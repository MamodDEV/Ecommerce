import 'package:ecommerce/controller/myfavourite_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/widget/favourtie/customlistfavitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavourite extends StatelessWidget {
  const MyFavourite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavouriteController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Items'),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GetBuilder<MyFavouriteController>(
            builder: (controller) => ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: GridView.builder(
                        itemCount: controller.data.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.7),
                        itemBuilder: (context, index) {
                          return CustomListFavItems(
                            itemsModel: controller.data[index],
                          );
                        }))
              ],
            ),
          )),
    );
  }
}
