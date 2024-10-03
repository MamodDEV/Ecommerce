import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyBDlM9YUKfkn5CBPAfvAmSovhykAZovo-8',
            appId: '1:489821312509:android:a72cd618a0fb16a849b594',
            messagingSenderId: '489821312509',
            projectId: 'ecommerce-9e9aa'));

    sharedPreferences = await SharedPreferences.getInstance();
    final fcmToken = await FirebaseMessaging.instance.getToken();

    print(fcmToken);

    return this;
  }
}

initializeServices() async {
  await Get.putAsync(() => MyServices().init());
}
