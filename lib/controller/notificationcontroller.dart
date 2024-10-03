import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/notification.dart';
import 'package:ecommerce/data/model/notificationmodel.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  MyServices myServices = Get.find();
  List<notificationModel> notification = [];
  StatusRequest statusRequest = StatusRequest.none;
  NotificationData notificationData = NotificationData(Get.find());
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await notificationData
        .getData(myServices.sharedPreferences.getString("id"));
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List datalist = response['data'];
        notification.addAll(datalist.map((e) => notificationModel.fromJson(e)));
        print(notification);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
