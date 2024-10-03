import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingAddressCard extends StatelessWidget {
  final String title;
  final String body;
  final bool isActive;
  const ShippingAddressCard(
      {super.key,
      required this.title,
      required this.body,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 9,
      child: Card(
        color: isActive ? AppColor.darkprimary : null,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
                fontSize: 16,
                color: isActive ? AppColor.white : AppColor.grey2,
                fontWeight: FontWeight.w800),
          ),
          subtitle: Text(
            body,
            style: TextStyle(
              fontSize: 14,
              color: isActive ? AppColor.white : AppColor.grey2,
            ),
          ),
        ),
      ),
    );
  }
}
