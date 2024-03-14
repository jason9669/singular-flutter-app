import UIKit
import Flutter
import singular_flutter_sdk

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    override func application(_ application: UIApplication,
      didFinishLaunchingWithOptions
      launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let idfv = UIDevice.current.identifierForVendor?.uuidString
        print("IDFV: \(idfv ?? "N/A")")
        GeneratedPluginRegistrant.register(with: self)
        if let singularAppDelegate = SingularAppDelegate.shared() {
            singularAppDelegate.launchOptions = launchOptions
          }
      return super.application(application, didFinishLaunchingWithOptions:launchOptions)
    }

    override func application(_ application: UIApplication,
      continue userActivity:NSUserActivity,
      restorationHandler: @escaping ([UIUserActivityRestoring]?)-> Void) -> Bool {
        if let singularAppDelegate = SingularAppDelegate.shared() {
          singularAppDelegate.continueUserActivity(userActivity, restorationHandler:nil)
        }
      return super.application(application, continue:userActivity,
        restorationHandler: restorationHandler);
    }

    override func application(_ app: UIApplication,
      open url: URL, options:[UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if let singularAppDelegate = SingularAppDelegate.shared() {
          singularAppDelegate.handleOpen(url, options: options)
        }
      return super.application(app, open: url, options: options);
    }
}
