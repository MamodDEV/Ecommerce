import 'package:ecommerce/controller/auth/logoutcontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/localization/changelocal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends GetView<LocaleController> {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    LogoutController logoutController = Get.put(LogoutController());
    return Container(
        child: Column(
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: Get.width / 2,
              decoration: const BoxDecoration(color: AppColor.darkprimary),
            ),
            Positioned(
              top: Get.width / 2.7,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(100)),
                child: CircleAvatar(
                  backgroundColor: AppColor.grey,
                  radius: 50,
                  child: Image.asset(
                    AppImageAsset.avatar,
                    width: Get.width / 12,
                  ),
                ),
              ),
            )
          ],
        ),
        Container(
            margin: EdgeInsets.only(top: Get.height / 12),
            child: Text(
              "    Welcome ${logoutController.myServices.sharedPreferences.getString('username')} !",
              style: const TextStyle(fontSize: 16, color: AppColor.darkprimary),
            )),
        SizedBox(
          height: Get.height / 32,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: const Text('Enable Notification'),
                    trailing: Switch(
                      onChanged: (value) {
                        value = !value;
                      },
                      value: false,
                    ),
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () => Get.toNamed(AppRoute.addressview),
                  child: const ListTile(
                    title: Text(
                      'My Addresses',
                    ),
                    trailing: Icon(Icons.location_on_outlined),
                  ),
                ),
                const Divider(),
                ListTile(
                  onTap: () async {
                    await launchUrl(Uri.parse('tel:+963934529196'));
                  },
                  title: Text('Contact Us'),
                  trailing: Icon(Icons.phone_callback_outlined),
                ),
                const Divider(),
                const ListTile(
                  title: Text('About Us'),
                  trailing: Icon(Icons.info_outline),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    Get.defaultDialog(
                      title: 'Change Language',
                      middleText: "All App Language",
                      confirm: MaterialButton(
                        onPressed: () {
                          controller.changeLang('ar');
                        },
                        child: const Text("Arabic"),
                      ),
                      cancel: MaterialButton(
                        onPressed: () {
                          controller.changeLang('en');
                        },
                        child: const Text('English'),
                      ),
                    );
                  },
                  child: const ListTile(
                    title: Text('Change Language'),
                    trailing: Icon(Icons.language_outlined),
                  ),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    logoutController.logout();
                  },
                  title: const Text('Logout'),
                  trailing: const Icon(Icons.logout_outlined),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
