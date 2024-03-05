import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_mazzuma_plugin/unofficial_mazzuma_plugin.dart';

void main() {
  test('payment processor', () {
    UnofficialMazzumaPlugin mazzumaPlugin = new UnofficialMazzumaPlugin();
    int price = 5000; //GHS 1.00 = 100peswes
    String network = "MTN";
    String recipientNumber = "0245436757";
    String recipientNetwork = '0503169330';
    String sender = "0245436757";
    String option = "rmtm";
    String apiKey = "XXXXXXXXXXXXXXXXXXXXXX";

    var response = mazzumaPlugin.processPayment(
        price: price,
        network: network,
        recipientNumber: recipientNumber,
        sender: sender,
        option: option,
        apiKey: apiKey,
        recipientNetwork: recipientNetwork);
    response.then(print);
    expect(response.then(print), "error");
  });
}
