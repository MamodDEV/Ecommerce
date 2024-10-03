import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class FavouriteData {
  Crud crud;
  FavouriteData(this.crud);

  addFavourite(itemid, userid) async {
    var response = await crud.postData(AppLink.favouriteAdd,
        {"itemid": itemid.toString(), "userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  removeFavourite(itemid, userid) async {
    var response = await crud.postData(AppLink.favouriteRemove,
        {"itemid": itemid.toString(), "userid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
