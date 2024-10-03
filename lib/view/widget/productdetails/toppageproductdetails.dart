import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/productdetailscontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class TopPageProductDetails extends GetView<ProductDetailControllerImp> {
  const TopPageProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: Get.height / 5,
          decoration: const BoxDecoration(
            color: AppColor.darkprimary,
          ),
        ),
        Positioned(
          top: 40,
          right: Get.width / 7,
          left: Get.width / 7,
          child: Hero(
            tag: "${controller.itemsModel.itemsId}",
            child: CachedNetworkImage(
                height: Get.height / 3.5,
                imageUrl:
                    '${AppLink.imageitems}/${controller.itemsModel.itemsImage!}'),
          ),
        )
      ],
    );
  }
}
