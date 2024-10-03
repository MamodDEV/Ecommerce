import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/data/datasource/remote/forgetpassword/verifycode.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode(String verifycode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  VerifyCodeData verifyCodeData = VerifyCodeData(Get.find());
  @override
  checkCode(verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeData.postData(email, verifycode);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        // data.addAll(response['data']);
        Get.offAllNamed(AppRoute.resetPassword, arguments: {'email': email});
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
}
