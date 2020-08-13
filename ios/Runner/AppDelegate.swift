import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? ) -> Bool {
    // 注册插件???????
    GeneratedPluginRegistrant.register(with: self)
    // 注册flutter端口的插件
    AsrPlugin.register(with: self.registrar(forPlugin: "AsrPlugain"))
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}