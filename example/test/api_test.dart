import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_mazzuma_plugin/src/unofficial_mazzuma_plugin.dart';

void main() {
  test('payment processor', () {
    UnofficialMazzumaPlugin mazzumaPlugin = new UnofficialMazzumaPlugin();
    double price = 50.00;
    String network = "MTN";
    String recipientNumber = "0245436757";
    String sender = "0245436757";
    String option = "rmtm";
    String apiKey = "XXXXXXXXXXXXXXXXXXXXXX";

    var response = mazzumaPlugin.processPayment(
        price, network, recipientNumber, sender, option, apiKey);
    response.then(print);
    expect(response.then(print), "error");
  });
}
