import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonCart extends StatelessWidget {
  final void Function()? onpressed;
  final String text;
  const CustomButtonCart({super.key, required this.text, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        onPressed: onpressed,
        color: AppColor.darkprimary,
        textColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(text),
      ),
    );
  }
}
