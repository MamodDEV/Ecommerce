import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;
  final bool active;
  const CustomButtonAppBar({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 5.5,
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: Get.width / 14,
              color: active ? AppColor.price : AppColor.grey2,
            ),
            // Text(
            //   title,
            //   style: TextStyle(
            //       fontSize: Get.width / 30,
            //       color: active ? AppColor.primaryColor : AppColor.grey2),
            // )
          ],
        ),
      ),
    );
  }
}
