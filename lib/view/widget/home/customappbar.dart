import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBarHome extends StatelessWidget {
  final String titleappbar;
  final void Function() onPressedSearch;
  final void Function() onPressedIconfav;
  final void Function() onPressedNotification;
  final TextEditingController mycontroller;
  final void Function(String)? onChanged;
  const CustomAppBarHome({
    super.key,
    required this.titleappbar,
    required this.onPressedSearch,
    required this.onPressedIconfav,
    required this.onPressedNotification,
    required this.mycontroller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: Row(children: [
        Expanded(
            child: TextFormField(
          cursorColor: AppColor.white,
          onChanged: onChanged,
          controller: mycontroller,
          style: const TextStyle(
            color: AppColor.white,
          ),
          decoration: InputDecoration(
              prefixIcon: IconButton(
                  onPressed: onPressedSearch,
                  icon: const Icon(
                    Icons.search,
                    color: AppColor.white,
                  )),
              hintText: titleappbar,
              hintStyle: const TextStyle(fontSize: 18, color: AppColor.white),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(30)),
              filled: true,
              fillColor: AppColor.primaryColor),
        )),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(30)),
          width: Get.width / 9,
          child: Center(
            child: IconButton(
                onPressed: onPressedIconfav,
                icon: const Icon(
                  Icons.favorite,
                  size: 25,
                  color: AppColor.white,
                )),
          ),
        ),
        const SizedBox(width: 5),
        Container(
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(30)),
          width: Get.width / 9,
          child: Center(
            child: IconButton(
                onPressed: onPressedNotification,
                icon: const Icon(
                  Icons.notifications,
                  size: 25,
                  color: AppColor.white,
                )),
          ),
        ),
      ]),
    );
  }
}
