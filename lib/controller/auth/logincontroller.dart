import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/auth/login_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';

abstract class LoginController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController email;
  bool isshowpass = true;
  late TextEditingController password;
  LoginData loginData = LoginData(Get.find());
  showPassword() {
    isshowpass = isshowpass == true ? false : true;
    update();
  }

  @override
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      print("================$response");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          // data.addAll(response['data']);
          if (response['data']['users_approve'].toString() == '1') {
            myServices.sharedPreferences
                .setString("id", response['data']['users_id'].toString());
            myServices.sharedPreferences
                .setString('username', response["data"]['users_name']);
            myServices.sharedPreferences
                .setString('email', response['data']['users_email']);
            myServices.sharedPreferences
                .setString('phone', response['data']['users_phone']);
            myServices.sharedPreferences.setString('step', '2');
            String userid = myServices.sharedPreferences.getString("id")!;
            FirebaseMessaging.instance.subscribeToTopic('users');
            FirebaseMessaging.instance.subscribeToTopic('users$userid');

            Get.offNamed(AppRoute.homePage);
          } else {
            Get.offNamed(AppRoute.verifysignup,
                arguments: {"email": email.text});
          }

          // if (response['data']['users_approve'] == '1') {
          //   Get.offNamed(AppRoute.homePage);
          // } else {
          //   Get.offNamed(AppRoute.verifysignup,
          //       arguments: {"email": email.text});
          // }
        } else {
          Get.defaultDialog(
              title: "Warning", middleText: "Email Or Password Not Correct !");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  goToSignUp() {
    Get.offAllNamed(AppRoute.signup);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
    });
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
