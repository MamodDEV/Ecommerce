import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  postData(username, email, phone, password) async {
    var response = await crud.postData(AppLink.signup, {
      "username": username,
      "phone": phone,
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
