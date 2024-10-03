class AppLink {
  ///////////////////server

  static const String server = 'http://192.168.175.174/ecommerce';
  static const String imagestatic = 'http://192.168.175.174/ecommerce/upload';

  ///////////////////image

  static const String imagecategories = '$imagestatic/categories';
  static const String imageitems = '$imagestatic/items';

  static const String test = '$server/test.php';

  ///////////////////auth

  static const String signup = '$server/auth/signup.php';
  static const String verifycode = '$server/auth/verifycode.php';
  static const String resendverifycode = '$server/auth/resend.php';
  static const String login = '$server/auth/login.php';
  static const String resetpasswordforgetpassword =
      '$server/forgetpassword/resetpassword.php';
  static const String checkemailforgetpassword =
      '$server/forgetpassword/checkemail.php';
  static const String verifyresetforgetpassword =
      '$server/forgetpassword/verifycode.php';
  ///////////////////home

  static const String home = '$server/home.php';
  static const String notification = '$server/notification.php';

  ///////////////////items

  static const String items = '$server/items/items.php';
  static const String search = '$server/items/search.php';
  //add item to favourite
  static const String favouriteAdd = '$server/favourite/add.php';
  static const String favouriteRemove = '$server/favourite/remove.php';
  static const String favouriteView = '$server/favourite/view.php';
  static const String deletefromfav =
      '$server/favourite/deletefromfavourite.php';
  ///////////////////cart
  static const String cartview = '$server/cart/view.php/';
  static const String cartadd = '$server/cart/add.php';
  static const String cartdelete = '$server/cart/delete.php';
  static const String cartgetcount = '$server/cart/getcountitems.php';
  ///////////////////address
  static const String addressview = '$server/address/view.php/';
  static const String addressadd = '$server/address/add.php';
  static const String addressdelete = '$server/address/delete.php';
  static const String addressedit = '$server/address/edit.php';
  ///////////////////coupon
  static const String checkcoupon = '$server/coupon/checkcoupon.php';
  //////////////////orders
  static const String checkout = '$server/orders/checkout.php';
  static const String archiveorders = '$server/orders/archive.php';
  static const String pendingorders = '$server/orders/pending.php';
  static const String orderdetails = '$server/orders/details.php';
  static const String orderdelete = '$server/orders/delete.php';
  static const String orderrating = '$server/orders/rating.php';

  ///offers
  static const String offers = '$server/offers.php';
}
