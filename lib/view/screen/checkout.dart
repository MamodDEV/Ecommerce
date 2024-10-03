import 'package:ecommerce/controller/checkout_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/widget/checkout/cardpaymentmethod.dart';
import 'package:ecommerce/view/widget/checkout/deliverymethod.dart';
import 'package:ecommerce/view/widget/checkout/shippingaddresscard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends GetView<CheckoutController> {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Checkout'),
        ),
        bottomNavigationBar: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 50,
          ),
          child: MaterialButton(
              color: AppColor.darkprimary,
              onPressed: () {
                controller.checkout();
              },
              child: const Text(
                "Checkout",
                style: TextStyle(
                    fontSize: 18,
                    color: AppColor.white,
                    fontWeight: FontWeight.bold),
              )),
        ),
        body: GetBuilder<CheckoutController>(
          builder: (controller) {
            return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                    padding: const EdgeInsets.all(20),
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        const Text(
                          'Choose Payment Method',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColor.darkprimary),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.changePaymentMethod('0');

                                ///cash
                              },
                              child: CardPaymentMethodCheckout(
                                isActive: controller.paymentMethod == '0'
                                    ? true
                                    : false,
                                title: "Pay with Cash",
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                controller.changePaymentMethod('1');

                                ///card
                              },
                              child: CardPaymentMethodCheckout(
                                isActive: controller.paymentMethod == '1'
                                    ? true
                                    : false,
                                title: "Pay with Card",
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          'Choose Delivery Method',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColor.darkprimary),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.changeDeliveryMethod('0'); //delivery
                              },
                              child: DeliveryMethod(
                                img: AppImageAsset.delivery,
                                isActive: controller.deliveryMethod == '0'
                                    ? true
                                    : false,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                controller.changeDeliveryMethod('1'); //pullover
                              },
                              child: DeliveryMethod(
                                img: AppImageAsset.pullover,
                                isActive: controller.deliveryMethod == '1'
                                    ? true
                                    : false,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        if (controller.deliveryMethod == "0")
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Choose Shipping Address',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.darkprimary),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              if (controller.dataAddress.isEmpty)
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Center(
                                      child: Text(
                                          "No Shipping Address Available , Add one by clicking on this Button"),
                                    ),
                                    MaterialButton(
                                      color: AppColor.darkprimary,
                                      textColor: AppColor.white,
                                      shape: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: const Text("Add Shipping Address"),
                                      onPressed: () =>
                                          Get.toNamed(AppRoute.addressadd),
                                    ),
                                  ],
                                )
                              else
                                ...List.generate(
                                  controller.dataAddress.length,
                                  (index) => InkWell(
                                    onTap: () => controller.changeShippingAddress(
                                        '${controller.dataAddress[index].addressId}'),
                                    child: ShippingAddressCard(
                                      body:
                                          "${controller.dataAddress[index].addressName}",
                                      title:
                                          "${controller.dataAddress[index].addressCity} ${controller.dataAddress[index].addressStreet}",
                                      isActive: controller.addressid ==
                                              controller
                                                  .dataAddress[index].addressId
                                                  .toString()
                                          ? true
                                          : false,
                                    ),
                                  ),
                                )
                            ],
                          )
                      ],
                    )));
          },
        ));
  }
}
