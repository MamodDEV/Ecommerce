import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/middleware/mymiddleware.dart';
import 'package:ecommerce/notification.dart';
import 'package:ecommerce/view/screen/address/addressadd.dart';
import 'package:ecommerce/view/screen/address/addressadddetails.dart';
import 'package:ecommerce/view/screen/address/addressedit.dart';
import 'package:ecommerce/view/screen/address/addresseditdetails.dart';
import 'package:ecommerce/view/screen/address/addressview.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce/view/screen/auth/login.dart';
import 'package:ecommerce/view/screen/auth/signup.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommerce/view/screen/auth/success_signup.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerce/view/screen/auth/verifysignup.dart';
import 'package:ecommerce/view/screen/cart.dart';
import 'package:ecommerce/view/screen/checkout.dart';
import 'package:ecommerce/view/screen/language.dart';
import 'package:ecommerce/view/screen/myfavourite.dart';
import 'package:ecommerce/view/screen/onboarding.dart';
import 'package:ecommerce/view/screen/orders/details.dart';
import 'package:ecommerce/view/screen/orders/pending.dart';
import 'package:ecommerce/view/screen/productdetails.dart';
import 'package:ecommerce/view/widget/home/homescreen.dart';
import 'package:ecommerce/view/screen/items.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: '/', page: () => const Language(), middlewares: [MyMiddleWare()]),
  // GetPage(name: '/', page: () => Cart()),

  // GetPage(name: '/', page: () => const MyHomePage(title: 'hey')),
  // GetPage(name: '/', page: () => const Productdetails()),
  GetPage(name: AppRoute.login, page: () => Login()),
  GetPage(name: AppRoute.signup, page: () => SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => ForgetPassword()),
  GetPage(name: AppRoute.verifyCode, page: () => VerifyCode()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.verifysignup, page: () => VerifySignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.homePage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.productdetails, page: () => const Productdetails()),
  GetPage(name: AppRoute.myfavourite, page: () => const MyFavourite()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  GetPage(name: AppRoute.addressedit, page: () => const AddressEdit()),
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(
      name: AppRoute.addresseditdetails,
      page: () => const AddressEditDetails()),
  GetPage(
      name: AppRoute.addressadddetails, page: () => const AddressAddDetails()),
  GetPage(name: AppRoute.checkout, page: () => const CheckOut()),
  GetPage(name: AppRoute.pendingorders, page: () => const PendingOrders()),
  GetPage(name: AppRoute.detailorders, page: () => const DetailsOrder()),
  GetPage(name: AppRoute.notifications, page: () => const NotificationPage()),
];
