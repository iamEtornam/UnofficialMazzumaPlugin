# unofficial_mazzuma_plugin

<p align="center">
    
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/RegNex/UnofficialMazzumaPlugin/graphs/commit-activity)
[![made-with-Flutter](https://img.shields.io/badge/Made%20with-Flutter-blue.svg)](https://www.flutter.io/)
[![made-with-Dart](https://img.shields.io/badge/Made%20with-Dart-yellow.svg)](https://www.dartlang.org/)
[![ForTheBadge built-with-love](http://ForTheBadge.com/images/badges/built-with-love.svg)](https://github.com/RegNex/)
</p>

This is an unofficial implementation of Mazzuma's payment Api in flutter

## Getting Started

### Installation

Add this to your pubspec.yaml (or create it):

```yaml
dependencies:
  unofficial_mazzuma_plugin: x.x.x  #latest version
```

Then run the flutter tooling:

```bash
flutter packages get
```

Or upgrade the packages with:

```bash
flutter packages upgrade
```

import library
```bash
import 'package:unofficial_mazzuma_plugin/unofficial_mazzuma_plugin.dart';
```


### Example

```dart

UnofficialMazzumaPlugin mazzumaPlugin = new UnofficialMazzumaPlugin();

 void makePayment(String userNetwork, String userNumber, double paymentAmount) {
    String paymentOption;
    String myNumber = "YOUR-MOBILE-NUMBER-HERE"; 
    String myApiKey = "YOUR-API-KEY-HERE";
    
/** This denotes the direction of cash flow. For example, rmta can be understood as an acronym of the phrase
‘receive mtn to airtel’, which means you would be receiving money to your Airtel account (the recipient number) 
from an MTN number(the sender). This format would hold for all transaction requests sent to the API.
 Do not forget to append the r at beginning. **/
 
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
    print("payment option is: $paymentOption");
    print("payment amount is: $paymentAmount");
    print("my number is: $myNumber");
    print("user Number is: $userNumber");
    print("myApiKey is: $myApiKey");

    CustomResponse customResponse = mazzumaPlugin.processPayment(paymentAmount, userNetwork,
        myNumber, userNumber, paymentOption, myApiKey);
    print(CustomResponse.toMap());
  }
```
