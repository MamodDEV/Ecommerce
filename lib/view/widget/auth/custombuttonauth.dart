import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  final void Function()? onpressed;
  final String text;
  const CustomButtonAuth({super.key, required this.text, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: onpressed,
        color: AppColor.primaryColor,
        textColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(text),
      ),
    );
  }
}
