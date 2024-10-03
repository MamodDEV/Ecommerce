import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);

  postData(email, password) async {
    var response = await crud.postData(AppLink.resetpasswordforgetpassword, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
