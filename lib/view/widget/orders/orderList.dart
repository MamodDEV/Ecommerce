import 'package:ecommerce/controller/orders/pendingcontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/ordersmodel.dart';
import 'package:ecommerce/view/widget/orders/ratingdialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class OrderList extends GetView<PendingOrderController> {
  final List<OrdersModel> order;
  final int length;
  const OrderList({
    super.key,
    required this.length,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
            length,
            (index) => Container(
                  height: 120,
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  child: Card(
                    child: Stack(
                      children: [
                        ListTile(
                          titleAlignment: ListTileTitleAlignment.titleHeight,
                          title: Text(
                            '#ORDER${order[index].ordersId}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            children: [
                              Row(
                                children: [
                                  const Text('Totalprice : '),
                                  Text(
                                    '${order[index].ordersTotalprice}\$',
                                    style: const TextStyle(
                                        color: AppColor.price,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Text('Status: '),
                                  Text(
                                    controller.orderStatus(
                                        order[index].ordersStatus!),
                                    style: const TextStyle(
                                        color: AppColor.price,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          leading: Text('#${order[index].ordersId} |'),
                        ),
                        Positioned(
                          right: 16,
                          top: 5,
                          child: SizedBox(
                            child: Column(
                              children: [
                                Text(
                                  Jiffy.parse(order[index].ordersDatetime!)
                                      .fromNow(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: AppColor.darkprimary),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 45,
                          right: 16,
                          child: SizedBox(
                            height: 30,
                            child: MaterialButton(
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              color: AppColor.darkprimary,
                              onPressed: () {
                                Get.toNamed(AppRoute.detailorders,
                                    arguments: {'model': order[index]});
                              },
                              child: const Text(
                                "Details",
                                style: TextStyle(
                                    color: AppColor.white, fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                        if (order[index].ordersStatus == 0)
                          Positioned(
                            bottom: 10,
                            right: 16,
                            child: SizedBox(
                              height: 30,
                              child: MaterialButton(
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                color: AppColor.darkprimary,
                                onPressed: () {
                                  controller.deletePendingOrders(
                                      order[index].ordersId.toString());
                                },
                                child: const Text(
                                  "Delete",
                                  style: TextStyle(
                                      color: AppColor.white, fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        if (order[index].ordersStatus == 3 &&
                            order[index].ordersRating == 0)
                          Positioned(
                            bottom: 10,
                            right: 16,
                            child: SizedBox(
                              height: 30,
                              child: MaterialButton(
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                color: AppColor.darkprimary,
                                onPressed: () {
                                  showRatingDialog(
                                      context, order[index].ordersId!);
                                },
                                child: const Text(
                                  "Rate",
                                  style: TextStyle(
                                      color: AppColor.white, fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ))
      ],
    );
  }
}
