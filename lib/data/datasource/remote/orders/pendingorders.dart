import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class PendingOrdersData {
  Crud crud;
  PendingOrdersData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.pendingorders, {'id': id});
    return response.fold((l) => l, (r) => r);
  }

  deleteOrder(String id) async {
    var response = await crud.postData(AppLink.orderdelete, {'orderid': id});
    return response.fold((l) => l, (r) => r);
  }
}
