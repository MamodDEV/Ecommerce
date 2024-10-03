import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:ecommerce/view/widget/customappbar.dart';
import 'package:ecommerce/view/widget/home/customappbar.dart';
import 'package:ecommerce/view/widget/home/customcardhome.dart';
import 'package:ecommerce/view/widget/home/customtitlehome.dart';
import 'package:ecommerce/view/widget/home/listcategorieshome.dart';
import 'package:ecommerce/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(children: [
            CustomAppBarHome(
              onPressedNotification: () {
                controller.goToNotification();
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
            HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: controller.isSearch
                    ? Container(
                        child: ListItemsSearch(
                          listdatasearch: controller.listsearch,
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomCardHome(
                            body: "${controller.cardbody}",
                            // ${controller.settings[0]['settings_title']}",
                            // title: "${controller.settings[0]['settings_body']}",
                            title: "${controller.cardtitle}",
                          ),
                          const CustomTitleHome(title: "Categories"),
                          const ListCategoriesHome(),
                          const CustomTitleHome(title: "Top Selling"),
                          const ListItemsHome(),
                          const CustomTitleHome(title: "Todays Offers"),
                          const ListItemsHome(),
                        ],
                      ))
          ])),
    );
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatasearch;
  const ListItemsSearch({super.key, required this.listdatasearch});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listdatasearch.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToProductDetails(listdatasearch[index]);
            },
            child: Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              margin: const EdgeInsets.all(25),
              height: 60,
              child: Row(
                children: [
                  CachedNetworkImage(
                      fit: BoxFit.fitHeight,
                      imageUrl:
                          '${AppLink.imageitems}/${listdatasearch[index].itemsImage}'),
                  Expanded(
                    flex: 2,
                    child: ListTile(
                      title: Text(listdatasearch[index].itemsName!),
                      subtitle: Text(listdatasearch[index].categoriesName!),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
