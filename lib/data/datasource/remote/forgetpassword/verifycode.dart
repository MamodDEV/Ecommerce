import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class VerifyCodeData {
  Crud crud;
  VerifyCodeData(this.crud);

  postData(email, verifycode) async {
    var response = await crud.postData(AppLink.verifyresetforgetpassword, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
