import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CardPaymentMethodCheckout extends StatelessWidget {
  final String title;
  final bool isActive;
  const CardPaymentMethodCheckout(
      {super.key, required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 20,
      padding: const EdgeInsets.all(8),
      width: Get.width / 1.1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(),
          color:
              isActive ? AppColor.darkprimary : AppColor.unselecteddarkprimary),
      child: Center(
        child: Text(title,
            style: TextStyle(
                fontSize: 17,
                color: isActive ? AppColor.white : AppColor.darkprimary,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
