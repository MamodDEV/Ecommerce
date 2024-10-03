import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:ecommerce/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 40,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 15),
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            return Categories(
              i: index,
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index]),
            );
          }),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCat(i!, categoriesModel.categoriesId!);
        // controller.goToItems(controller.categories, i!);
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
              builder: (controller) => Container(
                    padding:
                        const EdgeInsets.only(right: 8, left: 8, bottom: 7),
                    decoration: controller.selectedCat == i
                        ? BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 3, color: AppColor.primaryColor)))
                        : null,
                    child: Text(
                      "${translateDB(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
                      style: const TextStyle(
                        fontSize: 20,
                        color: AppColor.grey2,
                      ),
                    ),
                  ))
        ],
      ),
    );
  }
}
