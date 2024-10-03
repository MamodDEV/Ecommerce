import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class DetailsOrderData {
  Crud crud;
  DetailsOrderData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.orderdetails, {"orderid": id});
    return response.fold((l) => l, (r) => r);
  }
}
