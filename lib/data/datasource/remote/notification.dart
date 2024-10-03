import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);

  getData(userid) async {
    var response = await crud.postData(AppLink.notification, {'id': userid});
    return response.fold((l) => l, (r) => r);
  }
}
