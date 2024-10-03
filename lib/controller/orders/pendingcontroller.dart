import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/orders/pendingorders.dart';
import 'package:ecommerce/data/datasource/remote/rating_data.dart';
import 'package:ecommerce/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class PendingOrderController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  PendingOrdersData pendingOrdersData = PendingOrdersData(Get.put(Crud()));
  RatingData ratingData = RatingData(Get.find());
  List<OrdersModel> pendingorders = [];
  List<OrdersModel> archivedorders = [];
  MyServices myServices = Get.find();
  int i = 0;

  getPendingOrders() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingOrdersData
        .getData(myServices.sharedPreferences.getString('id')!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List datalist = response["data"];

        pendingorders = [];
        archivedorders = [];
        pendingorders.addAll(datalist
            .map((e) => OrdersModel.fromJson(e))
            .where((element) => element.ordersStatus != 3));
        archivedorders.addAll(datalist
            .map((e) => OrdersModel.fromJson(e))
            .where((element) => element.ordersStatus == 3));
        print(pendingorders);
        if (datalist.isEmpty) {
          statusRequest = StatusRequest.failure;
          update();
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  deletePendingOrders(String orderid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingOrdersData.deleteOrder(orderid);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        refreshPage();
        Get.snackbar("Successful Operation", 'Order Cancelled Successfully !');
      } else {
        print(response['status']);
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  setrating(int id, double rate, String comment) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await ratingData.setRating(id.toString(), rate.toString(), comment);
    print("================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.snackbar('Success', 'Rating went successfully');
        getPendingOrders();
        print("================$response");
      } else {
        statusRequest = StatusRequest.none;
      }
    }
    update();
  }

  refreshPage() {
    getPendingOrders();
  }

  changePage(String s) {
    if (s == "pending") i = 0;
    if (s == "archive") i = 1;
    update();
  }

  goToDetails(model) {
    return Get.toNamed(AppRoute.detailorders, arguments: {'model': model});
  }

  orderStatus(int s) {
    if (s == 0) return "Waiting Approval";
    if (s == 1) return "Preparing Order";
    if (s == 2) {
      return "On The Way";
    } else {
      return "Archived";
    }
  }

  onRefresh() async {
    statusRequest = StatusRequest.loading;
    update();
    await getPendingOrders();
  }

  @override
  void onInit() {
    getPendingOrders();
    super.onInit();
  }
}
