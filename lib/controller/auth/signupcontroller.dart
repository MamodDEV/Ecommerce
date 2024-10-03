import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/data/datasource/remote/auth/signup_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signup();
  goToLSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  List data = [];

  late TextEditingController email;
  late TextEditingController username;
  late TextEditingController phone;
  late TextEditingController password;
  bool isshowpass = true;
  showPassword() {
    isshowpass = isshowpass == true ? false : true;
    update();
  }

  SignupData signupData = SignupData(Get.find());
  @override
  signup() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postData(
          username.text, email.text, phone.text, password.text);
      print("================$response");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.verifysignup, arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "Warning", middleText: "Email Or Phone already Exist !");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else
      print('notValid');
  }

  @override
  goToLSignIn() {
    Get.offAllNamed(AppRoute.login);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    username = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    phone.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
