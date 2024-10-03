import 'package:ecommerce/controller/orders/pendingcontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

// show the dialog
showRatingDialog(BuildContext context, int id) {
  showDialog(
      routeSettings: RouteSettings(),
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => RatingDialog(
            initialRating: 3.0,
            // your app's name?
            title: const Text(
              'Rate Order',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            // encourage your user to leave a high rating?
            message: const Text(
              'Was Everything like Expected ? Please give us your opinion.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            // your app's logo?
            image: Image.asset(
              AppImageAsset.logo,
              height: 100,
              width: 100,
            ),
            submitButtonText: 'Submit',

            submitButtonTextStyle: const TextStyle(
              color: AppColor.darkprimary,
              fontWeight: FontWeight.bold,
            ),
            commentHint: 'Set your custom comment hint',
            onCancelled: () => print('cancelled'),
            onSubmitted: (response) {
              PendingOrderController controller = Get.find();
              controller.setrating(id, response.rating, response.comment);
              print('rating: ${response.rating}, comment: ${response.comment}');

              // // TODO: add your own logic
              // if (response.rating < 3.0) {
              //   // send their comments to your email or anywhere you wish
              //   // ask the user to contact you instead of leaving a bad review
              // } else {}
            },
          ));
}
