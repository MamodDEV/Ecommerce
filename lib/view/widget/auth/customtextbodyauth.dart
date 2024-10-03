import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String text;
  const CustomTextBodyAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        text.tr,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .displayMedium
            ?.copyWith(fontSize: 12, color: AppColor.grey),
      ),
    );
  }
}
