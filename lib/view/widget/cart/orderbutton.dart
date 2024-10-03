import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOrderButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  const CustomOrderButton({super.key, this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: Get.height / 18,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: AppColor.darkprimary,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(
          text!,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
