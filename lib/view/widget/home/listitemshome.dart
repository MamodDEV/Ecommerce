import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 230,
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            width: 5,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: controller.items.length,
          itemBuilder: (context, i) {
            return Items(
              itemsModel: ItemsModel.fromJson(controller.items[i]),
            );
          },
        ));
  }
}

class Items extends GetView<HomeControllerImp> {
  final ItemsModel itemsModel;
  const Items({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 200,
      child: InkWell(
        onTap: () {
          controller.goToProductDetails(itemsModel);
        },
        child: Card(
          elevation: 2,
          child: Stack(
            children: [
              Positioned(
                top: -10,
                left: -10,
                right: -10,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 232, 229, 229),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Image.network(
                    '${AppLink.imageitems}/${itemsModel.itemsImage}',
                    height: 100,
                    width: 150,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                  left: 15,
                  bottom: 80,
                  child: Text(
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    '${translateDB(itemsModel.categoriesNameAr, itemsModel.categoriesName)}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: AppColor.grey2,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  )),
              Positioned(
                  left: 15,
                  bottom: 60,
                  child: Text(
                    textWidthBasis: TextWidthBasis.longestLine,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    '${translateDB(itemsModel.itemsNameAr, itemsModel.itemsName)}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        overflow: TextOverflow.fade,
                        color: AppColor.darkprimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  )),
              Positioned(
                  left: 14,
                  bottom: 40,
                  child: Row(
                    children: [
                      ...List.generate(
                          5,
                          (index) => Icon(
                                Icons.star,
                                size: Get.width / 28,
                                color: const Color.fromARGB(255, 220, 176, 4),
                              )),
                    ],
                  )),
              Positioned(
                  left: 14,
                  bottom: 10,
                  child: itemsModel.itemsActive == 1
                      ? const Row(
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              size: 15,
                              color: Colors.green,
                            ),
                            Text(
                              "Available",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                          ],
                        )
                      : const Row(
                          children: [
                            Icon(
                              Icons.close_outlined,
                              size: 15,
                              color: Colors.red,
                            ),
                            Text("Not Available",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red)),
                          ],
                        )),
              Positioned(
                  right: 10,
                  bottom: 9,
                  child: Text(
                    textWidthBasis: TextWidthBasis.longestLine,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    '${itemsModel.itemsPrice} \$',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        overflow: TextOverflow.fade,
                        color: AppColor.price,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class listProduct extends GetView<HomeControllerImp> {
  final ItemsModel itemsModel;
  const listProduct({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProductDetails(itemsModel);
      },
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Image.network(
              '${AppLink.imageitems}/${itemsModel.itemsImage}',
              height: Get.height / 8,
              width: Get.width / 2.5,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 0),
            height: Get.height / 4,
            width: Get.width / 2,
          ),
          Positioned(
              left: 20,
              right: 20,
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.fade,
                '${translateDB(itemsModel.itemsNameAr, itemsModel.itemsName)}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    overflow: TextOverflow.fade,
                    color: AppColor.darkprimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ))
        ],
      ),
    );
  }
}
