import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/cupertino.dart';

class DeliveryMethod extends StatelessWidget {
  final String img;
  final bool isActive;
  const DeliveryMethod({super.key, required this.img, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(),
          color: isActive ? AppColor.darkprimary : null),
      child: Image.asset(
        img,
        color: isActive ? AppColor.grey : null,
      ),
    );
  }
}
