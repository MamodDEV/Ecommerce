import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PriceAndQuant extends GetView<ItemsControllerImp> {
  final void Function() onAdd;
  final void Function() onRemove;
  final String count;
  final String price;
  const PriceAndQuant({
    super.key,
    required this.onAdd,
    required this.onRemove,
    required this.count,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: Get.width / 10,
            height: Get.height / 20,
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColor.darkprimary),
            child: IconButton(
                onPressed: onAdd,
                icon: const Icon(
                  Icons.add,
                  color: AppColor.white,
                ))),
        Container(
          alignment: Alignment.center,
          width: Get.width / 8,
          height: Get.height / 20,
          padding: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColor.darkprimary, width: 3)),
          child: Text(
            count,
            style: const TextStyle(fontSize: 18, height: 1.1),
          ),
        ),
        Container(
            width: Get.width / 10,
            height: Get.height / 20,
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColor.darkprimary),
            child: IconButton(
                onPressed: onRemove,
                icon: const Icon(
                  Icons.remove,
                  color: AppColor.white,
                ))),
        const Spacer(),
        Container(
          padding: const EdgeInsets.only(bottom: 3),
          child: Text(
            "${price} \$",
            style: const TextStyle(
                height: 1.1,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColor.price),
          ),
        )
      ],
    );
  }
}
