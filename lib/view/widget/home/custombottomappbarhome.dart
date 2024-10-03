import 'package:ecommerce/controller/homescreen_controller.dart';
import 'package:ecommerce/view/widget/home/custombuttonappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(builder: (controller) {
      return BottomAppBar(
        height: Get.height / 14,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...List.generate(controller.listpage.length + 1, (index) {
              int i = index < 2 ? index : index - 1;

              return index == 2
                  ? const Spacer()
                  : CustomButtonAppBar(
                      active: controller.currentpage == i ? true : false,
                      onPressed: () {
                        controller.changepage(i);
                      },
                      icon: controller.buttomappbar[i]['icon'],
                    );
            })
          ],
        ),
      );
    });
  }
}
