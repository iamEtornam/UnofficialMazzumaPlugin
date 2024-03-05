import 'dart:async';

import 'package:dio/dio.dart';

import 'model/custom_response.dart';

class UnofficialMazzumaPlugin {
  Response? response;

  Future<CustomResponse?> processPayment(
      {
      /// The amount to be paid in peswes (GHS 1.00 = 100peswes)
      required int price,

      ///This is the mobile network of the mobile money account that would be making the payment to (your account)
      required String network,

      ///This is the mobile number of the mobile money account that would be making the payment (your customer)
      required String recipientNumber,

      ///This is the mobile money account the payments shall end up in. (your account).
      required String sender,

      ///This denotes the direction of cash flow. For example, rmta can be understood as an acronym of the phrase ‘receive mtn to airtel’, which means you would be receiving money to your Airtel account (the recipient number) from an MTN number(the sender). This format would hold for all transaction requests sent to the API. Do not forget to append the r at beginning
      required String option,

      ///This is the network of the mobile money account that would be making the payment (your customers)
      required String recipientNetwork,

      /// The order id (optional)
      String? orderId,

      ///The API key generated when you created the Mazzuma Business account. This can be accessed or changed via the web dashboard.
      required String apiKey}) async {
    BaseOptions options = BaseOptions(
      baseUrl: "https://api.mazzuma.com/v2",
    );

    Dio dio = new Dio(options);

    response = await dio.post("/money/transfer", data: {
      "price": price,
      "network": network,
      "recipient_number": recipientNumber,
      "recipient_network": recipientNetwork,
      "sender": sender,
      "option": option,
      "apikey": apiKey,
      "order_id": orderId
    });
    if (response == null) return null;
    CustomResponse customResponse = CustomResponse.fromMap(response!.data);

    ///The response for a request contains the following information. response.data, response.headers, response.request, response.statusCode

    return customResponse;
  }

  ///This plugin can be used by importing and initialise it then provide the required parameters
  ///import 'package:unofficial_mazzuma_plugin/unofficial_mazzuma_plugin.dart';
  ///
  ///UnofficialMazzumaPlugin mazzumaPlugin = UnofficialMazzumaPlugin();
  ///
  ///CustomResponse customResponse = mazzumaPlugin.processPayment(paymentAmount, userNetwork, myNumber, userNumber, paymentOption, myApiKey);
}
