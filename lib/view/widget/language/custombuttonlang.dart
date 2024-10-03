import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonLang extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  const CustomButtonLang({super.key, this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        color: AppColor.primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(
          text!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
