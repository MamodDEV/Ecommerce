import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class RatingData {
  Crud crud;
  RatingData(this.crud);

  setRating(String id, String rating, String comment) async {
    var response = await crud.postData(AppLink.orderrating, {
      'id': id.toString(),
      'rating': rating.toString(),
      'comment': comment.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
}
