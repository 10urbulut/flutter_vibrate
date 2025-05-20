import Flutter
import UIKit
import AudioToolbox

public class SwiftVibratePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "vibrate", binaryMessenger: registrar.messenger())
    let instance = SwiftVibratePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch (call.method) {
      case "canVibrate":
        #if !targetEnvironment(simulator)
        result(true)
        #else
        result(false)
        #endif

      case "vibrate":
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)

      case "impact":
        if #available(iOS 10.0, *) {
          let impact = UIImpactFeedbackGenerator()
          impact.prepare()
          impact.impactOccurred()
        } else {
          AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }

      case "selection":
        if #available(iOS 10.0, *) {
          let selection = UISelectionFeedbackGenerator()
          selection.prepare()
          selection.selectionChanged()
        } else {
          AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }

      case "success":
        if #available(iOS 10.0, *) {
          let notification = UINotificationFeedbackGenerator()
          notification.prepare()
          notification.notificationOccurred(.success)
        } else {
          AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }

      case "warning":
        if #available(iOS 10.0, *) {
          let notification = UINotificationFeedbackGenerator()
          notification.prepare()
          notification.notificationOccurred(.warning)
        } else {
          AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }

      case "error":
        if #available(iOS 10.0, *) {
          let notification = UINotificationFeedbackGenerator()
          notification.prepare()
          notification.notificationOccurred(.error)
        } else {
          AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }

      case "heavy":
        if #available(iOS 10.0, *) {
          let generator = UIImpactFeedbackGenerator(style: .heavy)
          generator.prepare()
          generator.impactOccurred()
        } else {
          AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }

      case "medium":
        if #available(iOS 10.0, *) {
          let generator = UIImpactFeedbackGenerator(style: .medium)
          generator.prepare()
          generator.impactOccurred()
        } else {
          AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }

      case "light":
        if #available(iOS 10.0, *) {
          let generator = UIImpactFeedbackGenerator(style: .light)
          generator.prepare()
          generator.impactOccurred()
        } else {
          AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }

      default:
        result(FlutterMethodNotImplemented)
    }
  }
}
