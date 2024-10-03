import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: Image.asset(
        AppImageAsset.logo,
        width: 20,
        height: 140,
      ),
    );
  }
}
