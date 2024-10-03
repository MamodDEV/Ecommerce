import 'package:ecommerce/data/datasource/static/static.dart';
import 'package:get/get.dart';

const String rootImg = "assets/images";
const String rootIco = "assets/lottie";
List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: "2".tr.tr, body: "3".tr.tr, image: '$rootImg/onboardingone.png'),
  OnBoardingModel(
      title: "4".tr, body: "5".tr, image: '$rootImg/onboardingtwo.png'),
  OnBoardingModel(
      title: "6".tr, body: "7".tr, image: '$rootImg/onboardingthree.png'),
  OnBoardingModel(
      title: "39".tr, body: "40".tr, image: '$rootImg/onboardingfour.png'),
];

class AppImageAsset {
  static const String logo = '$rootImg/logo.png';
  static const String loading = '$rootIco/loading.json';
  static const String offline = '$rootIco/offline.json';
  static const String server = '$rootIco/server.json';
  static const String noData = '$rootIco/noData.json';
  static const String onsale = '$rootImg/onsale1.png';
  static const String avatar = '$rootImg/avatar.png';
  static const String delivery = '$rootImg/delivery.png';
  static const String pullover = '$rootImg/pullover.png';
}
