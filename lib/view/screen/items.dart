import 'package:ecommerce/controller/favourite_controller.dart';
import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/screen/home.dart';
import 'package:ecommerce/view/widget/customappbar.dart';
import 'package:ecommerce/view/widget/items/customlistitems.dart';
import 'package:ecommerce/view/widget/items/listcategoriesitems.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavouriteController controllerfav = Get.put(FavouriteController());

    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        children: [
          CustomAppBar(
            onback: () {
              Get.offNamed(AppRoute.homePage);
            },
            onPressedNotification: () {},
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
          const SizedBox(
            height: 10,
          ),
          const ListCategoriesItems(),
          GetBuilder<ItemsControllerImp>(builder: (controller) {
            return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: controller.isSearch
                    ? Container(
                        child: ListItemsSearch(
                          listdatasearch: controller.listsearch,
                        ),
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (BuildContext context, index) {
                          controllerfav.isFavourite[controller.data[index]
                                  ['items_id']] =
                              controller.data[index]['favourite'];

                          return CustomListItems(
                            itemsModel:
                                ItemsModel.fromJson(controller.data[index]),
                          );
                        }));
          })
        ],
      ),
    ));
  }
}
