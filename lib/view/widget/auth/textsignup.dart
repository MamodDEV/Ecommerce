import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String textone, texttwo;
  final void Function()? ontap;
  const CustomTextSignUpOrSignIn(
      {super.key,
      required this.textone,
      required this.ontap,
      required this.texttwo});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textone),
        InkWell(
          onTap: ontap,
          child: Text(
            texttwo,
            style: TextStyle(
                color: AppColor.primaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
