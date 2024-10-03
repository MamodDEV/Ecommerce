import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class ArchiveOrdersData {
  Crud crud;
  ArchiveOrdersData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.archiveorders, {'id': id});
    return response.fold((l) => l, (r) => r);
  }
}
