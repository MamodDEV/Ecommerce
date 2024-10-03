import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardHome extends GetView<HomeControllerImp> {
  final String title;
  final String body;
  const CustomCardHome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(5)),
        child: Stack(children: [
          Positioned(
            top: -20.4,
            right: controller.lang == 'en' ? -20 : null,
            left: controller.lang == 'ar' ? -20 : null,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: AppColor.secondcolor,
                  borderRadius: BorderRadius.circular(160)),
            ),
          ),
          Positioned(
            top: -19.5,
            right: controller.lang == 'en' ? -20 : null,
            left: controller.lang == 'ar' ? -10 : null,
            child: Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                  color: AppColor.thirdcolor,
                  borderRadius: BorderRadius.circular(160)),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 150,
            // decoration: BoxDecoration(
            //     color: AppColor.primaryColor,
            //     borderRadius: BorderRadius.circular(5)),
            child: ListTile(
              title: Text(title,
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
              subtitle: Text(body,
                  style: const TextStyle(color: Colors.white, fontSize: 30)),
            ),
          ),
        ]),
      ),
    );
  }
}
