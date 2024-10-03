import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:ecommerce/data/model/categoriesmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            return Container(
              width: 60,
              child: Categories(
                i: index,
                categoriesModel:
                    CategoriesModel.fromJson(controller.categories[index]),
              ),
            );
          }),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
            controller.categories, i!, categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 238, 238, 238)),
            height: 50,
            width: 55,
            child: SvgPicture.network(
                '${AppLink.imagecategories}/${categoriesModel.categoriesImage}'),
          ),
          Text(
            overflow: TextOverflow.ellipsis,
            "${translateDB(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
