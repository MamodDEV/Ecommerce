import 'package:ecommerce/binding/initbinding.dart';
import 'package:ecommerce/core/localization/changelocal.dart';
import 'package:ecommerce/core/localization/translation.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      locale: controller.language,
      translations: MyTranslation(),
      title: 'E-Products',
      debugShowCheckedModeBanner: false,
      theme: controller.appTheme,
      initialBinding: InitBindings(),
      getPages: routes,
    );
  }
}
