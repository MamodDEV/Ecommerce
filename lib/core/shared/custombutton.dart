import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onpressed;
  final String text;
  const CustomButton({super.key, required this.text, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 30, right: 30),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: onpressed,
        color: AppColor.darkprimary,
        textColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(text),
      ),
    );
  }
}
