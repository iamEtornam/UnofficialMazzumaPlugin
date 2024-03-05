import 'dart:async';

import 'package:dio/dio.dart';

import 'model/custom_response.dart';

class UnofficialMazzumaPlugin {
  Response? response;

  Future<CustomResponse?> processPayment(
      double price,

      ///The amount to be paid
      String network,

      ///This is the network of the mobile money account that would be making the payment (your customer)
      String recipientNumber,

      ///This is the mobile money account the payments shall end up in. (your account).
      String sender,

      ///This is the mobile money account that would be making the payment (your customers)
      String option,

      ///This denotes the direction of cash flow. For example, rmta can be understood as an acronym of the phrase ‘receive mtn to airtel’, which means you would be receiving money to your Airtel account (the recipient number) from an MTN number(the sender). This format would hold for all transaction requests sent to the API. Do not forget to append the r at beginning
      String apiKey

      ///The API key generated when you created the Mazzuma Business account. This can be accessed or changed via the web dashboard.
      ) async {
    BaseOptions options = BaseOptions(
      baseUrl: "https://client.teamcyst.com",
    );

    Dio dio = new Dio(options);

    response = await dio.post("/api_call.php", data: {
      "price": price,
      "network": network,
      "recipient_number": recipientNumber,
      "sender": sender,
      "option": option,
      "apikey": apiKey,
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
