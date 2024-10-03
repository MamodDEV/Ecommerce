import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItem extends StatelessWidget {
  final String img;
  final String itemprice;
  final String itemname;
  final String itemquant;
  final void Function()? onAdd;
  final void Function()? onDelete;
  CartItem({
    super.key,
    required this.img,
    required this.itemprice,
    required this.itemquant,
    required this.itemname,
    required this.onAdd,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Dismissible(
        background: Container(
          color: Colors.red,
          child: const Icon(
            Icons.delete_forever_outlined,
            size: 35,
          ),
        ),
        key: const ValueKey<String>('sd'),
        child: Card(
          surfaceTintColor: AppColor.darkprimary,
          elevation: 4,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.itembackground,
                      borderRadius: BorderRadius.circular(5)),
                  child: CachedNetworkImage(
                    imageUrl: '${AppLink.imageitems}/$img',
                    height: Get.height / 10,
                  ),
                ),
              ),
              Expanded(
                  flex: 4,
                  child: ListTile(
                    title: Text(
                      itemname,
                      style: const TextStyle(fontSize: 16, height: 1.2),
                    ),
                    subtitle: Text(
                      "$itemprice \$",
                      style: const TextStyle(
                        color: AppColor.price,
                        fontSize: 16,
                      ),
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                        child: IconButton(
                          icon: const Icon(
                            Icons.add,
                            color: AppColor.darkprimary,
                          ),
                          iconSize: 20,
                          onPressed: onAdd,
                        ),
                      ),
                      Text(itemquant),
                      SizedBox(
                        height: 30,
                        child: IconButton(
                          icon: const Icon(Icons.remove),
                          iconSize: 20,
                          color: AppColor.darkprimary,
                          onPressed: onDelete,
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
