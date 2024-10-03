import 'package:ecommerce/view/screen/home.dart';
import 'package:ecommerce/view/screen/offerspage.dart';
import 'package:ecommerce/view/screen/orders/pending.dart';
import 'package:ecommerce/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changepage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listpage = [
    const Home(),
    const PendingOrders(),
    const OffersPage(),
    const Settings()
  ];
  List buttomappbar = [
    {"title": "Home", "icon": Icons.home},
    {"title": "Orders", "icon": Icons.production_quantity_limits},
    {"title": "Profile", "icon": Icons.local_offer_outlined},
    {"title": "Settings", "icon": Icons.settings},
  ];
  @override
  changepage(i) {
    currentpage = i;
    update();
  }
}
