import 'package:flutter/material.dart';
import 'package:unofficial_mazzuma_plugin/unofficial_mazzuma_plugin.dart';

class CheckOutPage extends StatefulWidget {
  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  final amountController = TextEditingController();

  final numberController = TextEditingController();

  String? isSelected;

  UnofficialMazzumaPlugin mazzumaPlugin = new UnofficialMazzumaPlugin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('checkout'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  'Payment was: ',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                          title: Text('Enter Payment Info',
                              style: TextStyle(
                                fontFamily: 'Champagne_Limousines',
                              )),
                          content: SingleChildScrollView(
                            child: Container(
                              height: 300.0,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                verticalDirection: VerticalDirection.down,
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          16.0, 10.0, 16.0, 10.0),
                                      child: DropdownButton(
                                          iconSize: 45.0,
                                          items: <String>[
                                            'MTN',
                                            'TIGO',
                                            'AIRTEL'
                                          ].map((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (String? value) {
                                            isSelected = value;
                                          })),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        16.0, 10.0, 16.0, 10.0),
                                    child: TextField(
                                      controller: amountController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter Amount ',
                                          hintStyle: TextStyle(
                                            fontFamily: 'Champagne_Limousines',
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        16.0, 10.0, 16.0, 10.0),
                                    child: TextField(
                                      controller: numberController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter Your Phone number',
                                          hintStyle: TextStyle(
                                            fontFamily: 'Champagne_Limousines',
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        16.0, 5.0, 16.0, 10.0),
                                    child: ButtonTheme(
                                      buttonColor:
                                          Theme.of(context).primaryColor,
                                      minWidth: double.infinity,
                                      height: 45.0,
                                      child: MaterialButton(
                                        color: Theme.of(context).primaryColor,
                                        onPressed: () async {
                                          if (isSelected == null) return;
                                          makePayment(
                                              isSelected!,
                                              numberController.text,
                                              double.parse(
                                                  amountController.text));
                                        },
                                        child: Text(
                                          'Process Payment',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily:
                                                  'Champagne_Limousines'),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: EdgeInsets.all(16.0),
                ),
                child: Text('Make Payment'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void makePayment(
      String userNetwork, String userNumber, double paymentAmount) {
    String paymentOption;
    String myNumber = "YOUR-MOBILE-NUMBER-HERE";
    String myApiKey = "YOUR-API-KEY-HERE";

    if (userNetwork == "AIRTEL") {
      paymentOption = "ratm";
    } else if (userNetwork == "MTN") {
      paymentOption = "rmtm";
    } else if (userNetwork == "TIGO") {
      paymentOption = "rttm";
    } else {
      paymentOption = "unknown";
    }
    print("network is: $userNetwork");
    print("payemnt option is: $paymentOption");
    print("payment amount is: $paymentAmount");
    print("my number is: $myNumber");
    print("user Number is: $userNumber");
    print("myApiKey is: $myApiKey");

    var response = mazzumaPlugin.processPayment(paymentAmount, userNetwork,
        myNumber, userNumber, paymentOption, myApiKey);
    response.then(print);
  }
}
