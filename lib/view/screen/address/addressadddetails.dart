import 'package:ecommerce/controller/address/adddetailscontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/core/shared/custombutton.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressDetailsController());
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColor.white),
          title: const Text(
            'Add Address Details',
            style: TextStyle(color: AppColor.white),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.all(15),
          child: GetBuilder<AddAddressDetailsController>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  CustomTextFormAuth(
                      hinttext: 'Enter Address Name',
                      labeltext: 'Name',
                      iconData: Icons.location_city_outlined,
                      mycontroller: controller.name!,
                      valid: (val) {
                        validInput(val!, 5, 20, 'username');
                        return null;
                      },
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: 'Enter Address City',
                      labeltext: 'City',
                      iconData: Icons.location_city_outlined,
                      mycontroller: controller.city!,
                      valid: (val) {
                        validInput(val!, 5, 20, 'username');
                        return null;
                      },
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: 'Street',
                      labeltext: 'Street',
                      iconData: Icons.location_city_outlined,
                      mycontroller: controller.street!,
                      valid: (val) {
                        validInput(val!, 5, 20, 'username');
                        return null;
                      },
                      isNumber: false),
                  CustomButton(
                    text: "Add",
                    onpressed: () {
                      controller.addDetails();
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
