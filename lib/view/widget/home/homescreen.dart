import 'dart:io';

import 'package:ecommerce/controller/homescreen_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/widget/home/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: AppColor.primaryColor,
                splashColor: AppColor.darkprimary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80)),
                onPressed: () {
                  Get.toNamed(AppRoute.cart);
                },
                child: const Icon(
                  Icons.shopping_cart_checkout_outlined,
                  color: Colors.white,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: const CustomBottomAppBarHome(),
              body: PopScope(
                child: controller.listpage.elementAt(controller.currentpage),
                canPop: false,
                onPopInvoked: (didPop) {
                  Get.defaultDialog(
                      title: "Alert",
                      middleText: "Do you want to exit the app ?",
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              exit(0);
                            },
                            child: const Text('Yes')),
                        ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('No'),
                        )
                      ]);
                },
              ),
            ));
  }
}
