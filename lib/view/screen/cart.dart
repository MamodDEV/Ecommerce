import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/widget/cart/cartitem.dart';
import 'package:ecommerce/view/widget/cart/custombottomnavbarcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (controller) => CustomBottomNavbarCart(
            price: "${controller.orderprice.round()}",
            discount: "${controller.discountcoupon}",
            totalprice: "${controller.getFinalPrice()}",
            couponcontroller: controller.couponcontroller!,
            onpressedcoupon: () {
              controller.checkCoupon();
            },
            shipping: '40',
          ),
        ),
        body: GetBuilder<CartController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          child: Column(
                        children: [
                          ...List.generate(
                            controller.data.length,
                            (index) => CartItem(
                              onAdd: () async {
                                await controller
                                    .add(controller.data[index].itemsId);
                                controller.refreshPage();
                              },
                              onDelete: () async {
                                await controller
                                    .delete(controller.data[index].itemsId);
                                controller.refreshPage();
                              },
                              img: controller.data[index].itemsImage!,
                              itemname: '${controller.data[index].itemsName}',
                              itemprice: '${controller.data[index].itemsprice}',
                              itemquant: '${controller.data[index].countitems}',
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                )));
  }
}
