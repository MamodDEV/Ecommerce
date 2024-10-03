import 'package:ecommerce/controller/productdetailscontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubItemsList extends GetView<ProductDetailControllerImp> {
  const SubItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subitems.length,
          (index) => Container(
            margin: const EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            height: 60,
            width: 90,
            decoration: BoxDecoration(
                color: controller.subitems[index]['active'].toString() == "1"
                    ? AppColor.darkprimary
                    : AppColor.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColor.primaryColor2)),
            child: Text(
              '${controller.subitems[index]['name']}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: controller.subitems[index]['active'].toString() == "1"
                      ? AppColor.white
                      : AppColor.darkprimary),
            ),
          ),
        )
      ],
    );
  }
}
