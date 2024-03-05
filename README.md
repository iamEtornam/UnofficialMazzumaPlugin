# unofficial_mazzuma_plugin

<p align="center">
    
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/iamEtornam/UnofficialMazzumaPlugin/graphs/commit-activity)
[![made-with-Flutter](https://img.shields.io/badge/Made%20with-Flutter-blue.svg)](https://www.flutter.dev/)
[![made-with-Dart](https://img.shields.io/badge/Made%20with-Dart-yellow.svg)](https://www.dartlang.org/)
[![ForTheBadge built-with-love](http://ForTheBadge.com/images/badges/built-with-love.svg)](https://github.com/iamEtornam/)
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

 void makePayment() {
    int price = 5000; //GHS 1.00 = 100peswes
    String network = "mtn";
    String recipientNumber = "vodafone";
    String recipientNetwork = '233503169330';
    String sender = "233245436757";
    String apiKey = "XXXXXXXXXXXXXXXXXXXXXX";
    
/** This denotes the direction of cash flow. For example, rmta can be understood as an acronym of the phrase
‘receive mtn to airtel’, which means you would be receiving money to your Airtel account (the recipient number) 
from an MTN number(the sender). This format would hold for all transaction requests sent to the API.
 Do not forget to append the r at beginning. **/
 
    if (userNetwork == "AIRTELTIGO") {
      paymentOption = "ratm"; 
    } else if (userNetwork == "MTN") {
      paymentOption = "rmtm";
    } else {
      paymentOption = "unknown";
    }

     final response = mazzumaPlugin.processPayment(
        price: price,
        network: network,
        recipientNumber: recipientNumber,
        sender: sender,
        option: paymentOption,
        apiKey: apiKey,
        recipientNetwork: recipientNetwork);
    print(response.toMap());
  }
```
