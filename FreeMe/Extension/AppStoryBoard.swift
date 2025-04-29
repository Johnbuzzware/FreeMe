//
//  AppStoryBoard.swift
//  TradeAir
//
//  Created by Adeel on 08/10/2019.
//  Copyright © 2019 Buzzware. All rights reserved.
//

import UIKit

class AppStoryBoard: NSObject {

}
extension UIStoryboard {
    
    //MARK:- Generic Public/Instance Methods
    
    func loadViewController(withIdentifier identifier: viewControllers) -> UIViewController {
        return self.instantiateViewController(withIdentifier: identifier.rawValue)
    }
    
    func loadViewControllerss(withIdentifier identifier: String) -> UIViewController {
        return self.instantiateViewController(withIdentifier: identifier)
    }
    
    
    //MARK:- Class Methods to load Storyboards
    
    class func storyBoard(withName name: storyboards) -> UIStoryboard {
        return UIStoryboard(name: name.rawValue , bundle: Bundle.main)
    }
    
    class func storyBoard(withTextName name:String) -> UIStoryboard {
        return UIStoryboard(name: name , bundle: Bundle.main)
    }
    
}

enum storyboards : String {
    case BioTech = "BioTech",
         Profile = "Profile",
         Home = "Home",
         HomeService = "HomeService",
         Messages = "Messages",
         Alert = "Alert",
        Qoutes = "Qoutes",
         QR = "QR",
         TailA = "TailA",
         main = "Main"
}



//navLoginVC = "navLoginVC",
//navLeftMenuVC = "navLeftMenuVC",
//leftMenuVC = "LeftMenuVC",
//navHomeVC = "navHomeVC",
//homeVC = "HomeVC",
//swRevealViewController = "SWRevealViewController",
//homeDetailVC = "HomeDetailVC",
enum viewControllers: String {
    
    //Login Storyboard
    case LoginViewController = "LoginViewController",
         SignUpViewController = "SignUpViewController",
         OnBoardViewController = "OnBoardViewController",
         HomeViewController = "HomeViewController",
         ServicesViewController = "ServicesViewController",
         Camera2ViewController = "Camera2ViewController",
         InverstmentsViewController = "InverstmentsViewController",
         
         MoreViewController = "MoreViewController",

         NotificatonsViewController = "NotificatonsViewController",
         ProfileViewController = "ProfileViewController",
         LgSideMenu = "LgSideMenu"
    
    
}
