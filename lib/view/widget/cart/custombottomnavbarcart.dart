import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/cart/custombuttoncart.dart';
import 'package:ecommerce/view/widget/cart/orderbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavbarCart extends GetView<CartController> {
  final TextEditingController couponcontroller;
  final String price;

  final String discount;
  final String shipping;
  final void Function()? onpressedcoupon;
  final String totalprice;
  const CustomBottomNavbarCart(
      {super.key,
      required this.price,
      required this.discount,
      required this.totalprice,
      required this.couponcontroller,
      this.onpressedcoupon,
      required this.shipping});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartController>(
            builder: (controller) => controller.couponname != null
                ? Container(
                    child: Text(
                    "Coupon ${controller.couponname} Activated !",
                    style: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ))
                : Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: TextFormField(
                              controller: couponcontroller,
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                hintText: "Enter Coupon Code",
                                border: OutlineInputBorder(),
                              ),
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            flex: 1,
                            child: CustomButtonCart(
                              text: "Apply",
                              onpressed: onpressedcoupon,
                            ))
                      ],
                    ),
                  ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 2),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 2, color: AppColor.darkprimary)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: const Text(
                        "Items Price",
                        style: TextStyle(fontSize: 18, color: AppColor.grey2),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text(
                        "$price \$",
                        style: const TextStyle(
                            fontSize: 18, color: AppColor.grey2),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: const Text(
                        "Discount",
                        style: TextStyle(fontSize: 18, color: AppColor.grey2),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text(
                        "$discount \%",
                        style: const TextStyle(
                            fontSize: 18, color: AppColor.grey2),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: const Text(
                        "Shipping",
                        style: TextStyle(fontSize: 18, color: AppColor.grey2),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text(
                        "$shipping \$",
                        style: const TextStyle(
                            fontSize: 18, color: AppColor.grey2),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: const Text(
                        "Total Price",
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColor.darkprimary,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text(
                        "$totalprice \$",
                        style: const TextStyle(
                            fontSize: 18,
                            color: AppColor.darkprimary,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomOrderButton(
            onPressed: () {
              controller.goToCheckout();
            },
            text: "Order",
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
