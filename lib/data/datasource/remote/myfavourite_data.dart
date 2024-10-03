import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class MyFavouriteData {
  Crud crud;
  MyFavouriteData(this.crud);

  getData(String id) async {
    var response =
        await crud.postData(AppLink.favouriteView, {"id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }

  delete(String id) async {
    var response =
        await crud.postData(AppLink.deletefromfav, {"favid": id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
