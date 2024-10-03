class OrdersModel {
  int? ordersId;
  int? ordersUserid;
  int? ordersAddress;
  int? ordersType;
  int? ordersPricedelivery;
  int? ordersPrice;
  num? ordersTotalprice;
  int? ordersCoupon;
  int? ordersRating;
  String? ordersRatingnote;
  int? ordersPaymentmethod;
  int? ordersStatus;
  String? ordersDatetime;
  int? addressId;
  int? addressUserid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;

  OrdersModel(
      {this.ordersId,
      this.ordersUserid,
      this.ordersAddress,
      this.ordersType,
      this.ordersPricedelivery,
      this.ordersPrice,
      this.ordersTotalprice,
      this.ordersCoupon,
      this.ordersRating,
      this.ordersRatingnote,
      this.ordersPaymentmethod,
      this.ordersStatus,
      this.ordersDatetime,
      this.addressId,
      this.addressUserid,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUserid = json['orders_userid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersPrice = json['orders_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersCoupon = json['orders_coupon'];
    ordersRating = json['orders_rating'];
    ordersRatingnote = json['orders_ratingnote'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersStatus = json['orders_status'];
    ordersDatetime = json['orders_datetime'];
    addressId = json['address_id'];
    addressUserid = json['address_userid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_userid'] = this.ordersUserid;
    data['orders_address'] = this.ordersAddress;
    data['orders_type'] = this.ordersType;
    data['orders_pricedelivery'] = this.ordersPricedelivery;
    data['orders_price'] = this.ordersPrice;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_rating'] = this.ordersRating;
    data['orders_ratingnote'] = this.ordersRatingnote;
    data['orders_paymentmethod'] = this.ordersPaymentmethod;
    data['orders_status'] = this.ordersStatus;
    data['orders_datetime'] = this.ordersDatetime;
    data['address_id'] = this.addressId;
    data['address_userid'] = this.addressUserid;
    data['address_name'] = this.addressName;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    return data;
  }
}
