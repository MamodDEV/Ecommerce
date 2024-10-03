import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  addCart(itemid, userid) async {
    var response = await crud.postData(AppLink.cartadd,
        {"itemid": itemid.toString(), "userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(itemid, userid) async {
    var response = await crud.postData(AppLink.cartdelete,
        {"itemid": itemid.toString(), "userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getCountCart(itemid, userid) async {
    var response = await crud.postData(AppLink.cartgetcount,
        {"itemid": itemid.toString(), "userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  viewCart(userid) async {
    var response =
        await crud.postData(AppLink.cartview, {"userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponName) async {
    var response = await crud
        .postData(AppLink.checkcoupon, {"couponName": couponName.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
