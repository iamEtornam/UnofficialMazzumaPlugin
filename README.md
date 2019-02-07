# unofficial_mazzuma_plugin

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
    print("payemnt option is: $paymentOption");
    print("payment amount is: $paymentAmount");
    print("my number is: $myNumber");
    print("user Number is: $userNumber");
    print("myApiKey is: $myApiKey");

    var response = mazzumaPlugin.processPayment(paymentAmount, userNetwork,
        myNumber, userNumber, paymentOption, myApiKey);
    response.then(print);
  }
```
