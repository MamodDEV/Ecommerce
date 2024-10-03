import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/data/datasource/remote/auth/verifysignup_data.dart';
import 'package:get/get.dart';

abstract class VerifySignUpController extends GetxController {
  checkCode();
  goToSuccessSignup(String verifycode);
}

class VerifySignUpControllerImp extends VerifySignUpController {
  late String email;
  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkCode() {}
  VerifySignupData verifySignupData = VerifySignupData(Get.find());

  @override
  goToSuccessSignup(verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifySignupData.postData(email, verifycode);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        // data.addAll(response['data']);
        Get.offAllNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "Verify Code is not Correct !");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  resend() async {
    var response = await verifySignupData.resendData(email);
    if (response['status'] == 'success') {
      Get.snackbar('Alert', 'Check Your Email Please !');
    }
  }
}
