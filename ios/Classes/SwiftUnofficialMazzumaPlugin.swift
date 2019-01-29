import Flutter
import UIKit

public class SwiftUnofficialMazzumaPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "unofficial_mazzuma_plugin", binaryMessenger: registrar.messenger())
    let instance = SwiftUnofficialMazzumaPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
