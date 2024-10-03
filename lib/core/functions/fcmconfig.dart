import 'package:ecommerce/controller/orders/pendingcontroller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

requestPermissionNotification() async {
  await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true);
}

fcmConfig() {
  FirebaseMessaging.onMessage.listen((message) {
    FlutterRingtonePlayer().playNotification();

    Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreshOrderNotification(message.data);
  });
}

refreshOrderNotification(data) {
  // print(data['story_name']);
  // print(Get.currentRoute);

  if (Get.currentRoute == '/homepage' && data['story_name'] == "refreshorder") {
    PendingOrderController controller = Get.find();
    controller.refreshPage();
  }
}
