import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class VerifySignupData {
  Crud crud;
  VerifySignupData(this.crud);

  postData(String email, String verifyCode) async {
    var response = await crud.postData(AppLink.verifycode, {
      "email": email,
      "verifycode": verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }

  resendData(String email) async {
    var response = await crud.postData(AppLink.resendverifycode, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
