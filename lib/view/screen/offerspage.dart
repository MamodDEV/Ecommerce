import 'package:ecommerce/controller/favourite_controller.dart';
import 'package:ecommerce/controller/offerscontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/screen/home.dart';
import 'package:ecommerce/view/widget/home/customappbar.dart';
import 'package:ecommerce/view/widget/offer/customlistoffer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    Get.put(FavouriteController());
    return Scaffold(
      body: GetBuilder<OffersController>(
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                CustomAppBarHome(
                  onPressedNotification: () {
                    Get.toNamed(AppRoute.notifications);
                  },
                  onChanged: (val) {
                    controller.onChangeSearch(val);
                  },
                  mycontroller: controller.search,
                  onPressedSearch: () {
                    controller.onPressedSearch();
                  },
                  titleappbar: "Find Product",
                  onPressedIconfav: () {
                    Get.toNamed(AppRoute.myfavourite);
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: controller.isSearch
                        ? Container(
                            child: ListItemsSearch(
                              listdatasearch: controller.listsearch,
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.data.length,
                            itemBuilder: ((context, index) {
                              return Container(
                                padding: EdgeInsets.only(bottom: 5),
                                child: CustomListOffer(
                                    itemsModel: controller.data[index]),
                              );
                            })))
              ],
            ),
          );
        },
      ),
    );
  }
}
