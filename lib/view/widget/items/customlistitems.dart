import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/favourite_controller.dart';
import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  const CustomListItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProductDetails(itemsModel);
      },
      child: Card(
        child: Stack(
          children: [
            Padding(
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
                        fontSize: 15,
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
                                color: const Color.fromARGB(255, 220, 176, 4),
                              )),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        '(144 reviews)',
                        style: TextStyle(color: AppColor.grey, fontSize: 12),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          "${itemsModel.itemsPrice}\$",
                          style: TextStyle(
                              decoration: itemsModel.itemsDiscount != 0
                                  ? TextDecoration.lineThrough
                                  : null,
                              decorationStyle: TextDecorationStyle.solid,
                              decorationThickness: VisualDensity.maximumDensity,
                              color: AppColor.grey2,
                              fontSize: itemsModel.itemsDiscount != 0 ? 14 : 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      if (itemsModel.itemsDiscount != 0)
                        Expanded(
                          flex: 4,
                          child: Text(
                            "${itemsModel.itemsPriceDiscount!.floor()}\$",
                            style: const TextStyle(
                                color: AppColor.price,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      const Expanded(
                          flex: 2,
                          child: Divider(
                            color: Colors.transparent,
                          )),
                      GetBuilder<FavouriteController>(
                        builder: (controller) => Expanded(
                          flex: 3,
                          child: IconButton(
                              onPressed: () {
                                if (controller
                                        .isFavourite[itemsModel.itemsId] ==
                                    1) {
                                  print(controller.isFavourite);

                                  controller.setFavourite(
                                      itemsModel.itemsId, 0);
                                  controller.removeFav(itemsModel.itemsId);
                                } else {
                                  controller.setFavourite(
                                      itemsModel.itemsId, 1);
                                  controller.addFav(itemsModel.itemsId);
                                }
                              },
                              icon: Icon(
                                controller.isFavourite[itemsModel.itemsId] == 1
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: AppColor.darkprimary,
                              )),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            if (itemsModel.itemsDiscount != 0)
              Positioned(
                top: 15,
                left: 5,
                child: Image.asset(
                  AppImageAsset.onsale,
                  width: Get.width / 7,
                ),
              )
          ],
        ),
      ),
    );
  }
}
