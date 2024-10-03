import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/myfavourite_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:ecommerce/data/model/myfavourite.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListFavItems extends GetView<MyFavouriteController> {
  final MyFavouriteModel itemsModel;
  const CustomListFavItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyFavouriteController>(
        builder: (controller) => InkWell(
              onTap: () {
                // controller.goToProductDetails(itemsModel);
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                        tag: "${itemsModel.itemsId}",
                        child: CachedNetworkImage(
                          imageUrl:
                              "${AppLink.imageitems}/${itemsModel.itemsImage!}",
                          height: Get.height / 8.5,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        maxLines: 1,
                        "${translateDB(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                        style: const TextStyle(
                            color: AppColor.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          ...List.generate(
                              5,
                              (index) => Icon(
                                    Icons.star,
                                    size: Get.width / 28,
                                    color:
                                        const Color.fromARGB(255, 220, 176, 4),
                                  )),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            '(144 reviews)',
                            style:
                                TextStyle(color: AppColor.grey, fontSize: 12),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${itemsModel.itemsPrice}\$",
                            style: const TextStyle(
                                color: AppColor.price,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              color: Colors.red,
                              onPressed: () {
                                controller.deletefromfavourite(
                                    itemsModel.favouriteId.toString());
                              },
                              icon: const Icon(
                                Icons.remove_circle_outline_rounded,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
