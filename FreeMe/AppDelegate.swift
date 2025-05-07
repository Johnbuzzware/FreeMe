//
//  AppDelegate.swift
//  FreeMe
//
//  Created by Asad's Mac on 14/02/2025.
//

import UIKit
import IQKeyboardManagerSwift
import Firebase
import LGSideMenuController
import FirebaseInstallations
import FirebaseMessaging

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var deviceTokenForPushN = ""
    var orientationLock = UIInterfaceOrientationMask.portrait
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        IQKeyboardManager.shared.isEnabled = true
        IQKeyboardManager.shared.resignOnTouchOutside = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        
        
        FirebaseApp.configure()
        self.checkUserAlreadyLogin()
        setUpAppNotifications()
        
        
        return true
    }
    
    
    
    func checkUserAlreadyLogin(_ controllers: UIViewController? = nil, navcontrollers: UINavigationController? = nil , isNoti:Bool? = false) {
        
        
        var storyboard :UIStoryboard!
        
        if let user = Auth.auth().currentUser{
            
            storyboard = UIStoryboard(name: "Home", bundle: nil)
            let controller = storyboard.instantiateViewController(identifier: "LgSideMenu") as! LGSideMenuController
            self.window?.rootViewController = controller
            if let controll = controllers{
                
                controller.rootViewController?.sideMenuController?.rootViewController = controll
                
            }
        }else{
            storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(identifier: "ViewMain") as! UINavigationController
            self.window?.rootViewController = controller
            
        }
        
        self.window?.makeKeyAndVisible()
        
    }
    
}

//MARK:- NOTIFICATION HELPING METHOD'S
extension AppDelegate{
    
    func setUpAppNotifications() {
        let token = Messaging.messaging().fcmToken
        print("FCM token: \(token ?? "")")
        deviceTokenForPushN = (" \(token ?? "")")
        print("FCM deviceTokenForPushN: \(deviceTokenForPushN )")
        UserDefaults.standard.set(deviceTokenForPushN, forKey: "Constant.token_id")
        UserDefaults.standard.synchronize()
        UIApplication.shared.applicationIconBadgeNumber = 0
        UNUserNotificationCenter.current().delegate = self
        self.registerForPushNotifications()
        
    }
    func registerForPushNotifications() {
        
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge]) { [weak self] granted, error in
                print("Permission granted: \(granted)")
                guard granted else { return }
                self?.getNotificationSettings()
            }
    }
    func getNotificationSettings() {
        
        
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            print("Notification settings: \(settings)")
            guard settings.authorizationStatus == .authorized else { return }
            DispatchQueue.main.async {
                
                let types:UIUserNotificationType = [UIUserNotificationType.alert, UIUserNotificationType.badge, UIUserNotificationType.sound]
                
                UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: types, categories: nil))
                
                UIApplication.shared.registerForRemoteNotifications()
                NotificationCenter.default.addObserver(self, selector: #selector(self.refreshToken(notification:)) , name: .MessagingRegistrationTokenRefreshed, object: nil)
            }
        }
    }
    
    @objc func refreshToken(notification : NSNotification) {
        Installations.installations().installationID { (result, error) in
            if let error = error {
                print("Error fetching remote instange ID: \(error)")
            } else if let result = result {
                print("Remote instance ID token: \(result)")
            }
        }
    }
    
}
//MARK:- NOTIFICATION DELEGATES METHOD'S
extension AppDelegate:UNUserNotificationCenterDelegate {
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        if notification.request.identifier == "Local Notification Order" {
            print("Handling notifications with the Local Notification Identifier")
            center.removeDeliveredNotifications(withIdentifiers: [notification.request.identifier])
            center.removePendingNotificationRequests(withIdentifiers: [notification.request.identifier])
        }
        
        UIApplication.shared.applicationIconBadgeNumber = 1
        completionHandler(UNNotificationPresentationOptions([.badge,.banner,.sound]))
        let userInfo = notification.request.content.userInfo
        guard let aps = userInfo["aps"] as? [String: AnyObject] else {
            completionHandler(UNNotificationPresentationOptions([.badge,.banner,.sound]))
            return
        }
        
        print(userInfo as NSDictionary)
        print(aps)
        
        //NotificationCenter.default.post(name: .readMesage, object: nil)
        //NotificationCenter.default.post(name: .reciveOTP, object: nil)
        
        
        
        if let videoData = userInfo as? NSDictionary {
            if let alert = aps["alert"] as? [String:AnyObject] {
                guard let title = alert["title"] as? String else {
                    return
                }
                guard let detail = alert["body"] as? String else {
                    return
                }
                //self.saveIntoCache(videoData: videoData, title: title, detail: detail)
            }
        }
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.notification.request.identifier == "Local Notification Order" {
            print("Handling notifications with the Local Notification Identifier")
            center.removeDeliveredNotifications(withIdentifiers: [response.notification.request.identifier])
            UIApplication.shared.applicationIconBadgeNumber = 0
            completionHandler()
        }
        
        let userInfo = response.notification.request.content.userInfo
        print ("the user info is " , userInfo )
        
        var conversationID = ""
        var userId = ""
        
        //      if let videoData = userInfo as? NSDictionary {
        //        if let convers = videoData["conversion_id"] as? String{
        //          if let userIddd = videoData["user_id"] as? String {
        //              conversationID = convers
        //              userId = userIddd
        //
        //              FirebaseData.getUserData(uid: userId) { error, userData in
        //                  if let error = error {
        //                      print("error")
        //                  }
        //                  else{
        //
        //                      if let userData = userData {
        //                          let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //                          let vc = storyboard.instantiateViewController(withIdentifier: "MessagesDetailViewController") as! MessagesDetailViewController
        //
        //                          vc.userName = userData.fullname
        //                          vc.receiverUser = userData
        //                          vc.conversationID = conversationID
        //
        //                          self.checkUserAlreadyLogin(vc)
        //                      }
        //                      else{
        //
        //                         print("no user")
        //                      }
        //
        //
        //                  }
        //              }
        //          }
        //        }
        //          if let proId = videoData["productId"] as? String{
        //
        //              FirebaseData.getProductData(uid: proId) { error, model in
        //                  if let error = error {
        //                      print("error")
        //
        //                  }
        //                  else{
        //
        //                      let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //                      let vc = storyboard.instantiateViewController(withIdentifier: "ProductShowDetilViewController") as! ProductShowDetilViewController
        //                      vc.modelData = model!
        //                      self.checkUserAlreadyLogin(vc)
        //                  }
        //              }
        //
        //
        //          }
        //
        //      }
        
    }
    @objc func userNotify(){
        let notificationCenter = UNUserNotificationCenter.current()
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        notificationCenter.requestAuthorization(options: options) {
            (didAllow, error) in
            if !didAllow {
                print("User has declined notifications")
                return
            }
        }
        notificationCenter.getNotificationSettings { (settings) in
            if settings.authorizationStatus != .authorized {
                // Notifications not allowed
                return
            }
        }
        let content = UNMutableNotificationContent() // Содержимое уведомления
        content.title = "TastyBox"
        content.body = "Your Order Ready please collect it now"
        content.sound = UNNotificationSound.default
        content.badge = 1
        let date = Date(timeIntervalSinceNow: 1800)
        let triggerHourly = Calendar.current.dateComponents([.second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerHourly, repeats: true)
        let identifier = "Local Notification Order"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        notificationCenter.add(request) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
        notificationCenter.delegate = self
    }
}


