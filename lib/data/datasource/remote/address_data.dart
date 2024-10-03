import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);

  viewAddress(String id) async {
    var response = await crud.postData(AppLink.addressview, {
      "userid": id,
    });
    return response.fold((l) => l, (r) => r);
  }

  editAddress(String id, String name, String city, String street, String lat,
      String long) async {
    var response = await crud.postData(AppLink.addressedit, {
      "addressid": id,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
    });
    return response.fold((l) => l, (r) => r);
  }

  addAddress(String id, String name, String city, String street, String lat,
      String long) async {
    var response = await crud.postData(AppLink.addressadd, {
      "userid": id,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteAddress(String id) async {
    var response = await crud.postData(AppLink.addressdelete, {
      "addressid": id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
