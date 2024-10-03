import 'package:ecommerce/controller/auth/signupcontroller.dart';
import 'package:ecommerce/core/class/crud.dart';
import 'package:get/get.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpControllerImp(), fenix: true);

    Get.put(Crud());
  }
}
