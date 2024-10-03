import 'package:ecommerce/controller/address/viewcontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/addressview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressViewController());
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.toNamed(AppRoute.homePage);
            },
          ),
          iconTheme: const IconThemeData(color: AppColor.white),
          title: const Text(
            'Address',
            style: TextStyle(color: AppColor.white),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.darkprimary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: const Icon(
              Icons.add,
              size: 35,
            ),
            foregroundColor: AppColor.white,
            onPressed: () {
              Get.toNamed(AppRoute.addressadd);
            }),
        body: GetBuilder<AddressViewController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                child: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, i) => AddressCart(
                          addressViewMode: controller.data[i],
                          onEdit: () {
                            controller.goToEdit(i);
                          },
                          onDelete: () {
                            controller.deleteAddress(
                                controller.data[i].addressId.toString());
                          },
                        )),
              )),
        ));
  }
}

class AddressCart extends StatelessWidget {
  final AddressViewModel addressViewMode;
  final void Function()? onDelete;
  final void Function()? onEdit;
  const AddressCart(
      {super.key, required this.addressViewMode, this.onDelete, this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          height: Get.height / 12,
          child: ListTile(
            title: Text('${addressViewMode.addressName}'),
            subtitle: Text(
                "${addressViewMode.addressStreet} ${addressViewMode.addressCity}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit_location_alt_outlined),
                  onPressed: onEdit,
                ),
                IconButton(
                  icon: Icon(Icons.delete_outline_outlined),
                  onPressed: onDelete,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
