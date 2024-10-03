import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/data/datasource/remote/forgetpassword/checkemail.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  checkEmail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;
  StatusRequest statusRequest = StatusRequest.none;
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  @override
  checkEmail() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postData(email.text);
      print("================$response");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          // data.addAll(response['data']);
          Get.toNamed(AppRoute.verifyCode, arguments: {'email': email.text});
        } else {
          Get.defaultDialog(title: "Warning", middleText: "Email Not Exist !");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
