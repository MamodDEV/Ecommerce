import 'package:ecommerce/controller/productdetailscontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/productdetails/priceandquantity.dart';
import 'package:ecommerce/view/widget/productdetails/subitemslist.dart';
import 'package:ecommerce/view/widget/productdetails/toppageproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Productdetails extends StatelessWidget {
  const Productdetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailControllerImp());
    return Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: GetBuilder<ProductDetailControllerImp>(
            builder: (controller) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                  height: Get.height / 18,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: AppColor.darkprimary,
                    height: Get.height,
                    onPressed: () {
                      controller.goToCart();
                    },
                    child: const Text(
                      'Go to Cart',
                      style: TextStyle(
                          color: AppColor.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                )),
        body: GetBuilder<ProductDetailControllerImp>(
          builder: (controller) {
            return Container(
              child: ListView(
                children: [
                  const TopPageProductDetails(),
                  const SizedBox(
                    height: 120,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${controller.itemsModel.itemsName}',
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColor.grey2,
                                height: 1.1)),
                        SizedBox(
                          height: Get.height / 64,
                        ),
                        PriceAndQuant(
                          onAdd: () {
                            controller.add();
                          },
                          onRemove: () {
                            controller.delete();
                          },
                          count: '${controller.countitem}',
                          price: '${controller.itemsModel.itemsPriceDiscount}',
                        ),
                        SizedBox(
                          height: Get.height / 64,
                        ),
                        Text('${controller.itemsModel.itemsDesc}',
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColor.grey,
                                height: 1.5)),
                        SizedBox(
                          height: Get.height / 64,
                        ),
                        const Text('Color',
                            style: TextStyle(
                                fontSize: 24,
                                color: AppColor.grey2,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 20,
                        ),
                        const SubItemsList()
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
