//
//  Globals.swift
//  TradeAir
//
//  Created by Adeel on 08/10/2019.
//  Copyright © 2019 Buzzware. All rights reserved.
//

import UIKit

class Globals
{
    static let shared = Globals()
    
    //Initializer access level change now
    private init(){}
    
    
    // MARK: - App Infos
    public let APP_NAME:String = (Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String)!
    public let APP_VERSION = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String
    public let APP_BUILD = Bundle.main.infoDictionary!["CFBundleVersion"] as? String
    
    public let APP_ID:String = "711338920"
    public let COMPANY_NAME:String = "Wadic"
    public let POWERED_BY_COMPANY_NAME:String = "Copyright 2019"
    public let kEmail_COMPANY_CONTACT_EMAIL:String = "contactus@wadic.com"
    public let kEmail_CC:String = ""
    public let kEmail_BCC:String = ""
    public let APP_STORE_URL:String = ""
    public let APP_STORE_REVIEW_URL:String = ""
    
    
    // MARK: - Typedefs
    typealias OperationCompletionBlock = (Bool, Error?) -> Void
    static let iphone_SE1_5_5s_5c_hieght1:CGFloat = 568
    static let iphone_SE2_8_7_6s_6_hieght2:CGFloat = 667
    static let iphone_8_Plus_hieght3:CGFloat = 736
    static let iphone_13m_12m_11pro_XS_X_hieght4:CGFloat = 812
    static let iphone_7_6s_6_Plus_hieght5:CGFloat = 847
    static let iphone_13Pro_13_12Pro_12_hieght6:CGFloat = 844
    static let iphone_11ProMax_11_XsMax_XR_hieght7:CGFloat = 896
    static let iphone_13ProMax_12ProMax_hieght8:CGFloat = 926
    
    
    
    
    // MARK: - Date Formates
    static let __AM_Symbol:String                        = "AM";
    static let __PM_Symbol:String                        = "PM";
    
    static let __dd_MMMM_yyyy:String                     = "dd MMMM yyyy";
    static let __MMM_dd_yyyy:String                     = "MMM dd, yyyy";
    static let __MMM_dd_yyyy_hh_mm_a:String                     = "MMM dd, yyyy hh:mm a";
    static let __yyyy_MM_dd:String                       = "yyyy-MM-dd";
    static let __dd_MM_yyyy:String                       = "dd/MM/yyyy";
    static let __dd__MM__yyyy:String                       = "dd.MM.yyyy";
    static let __MMM_dd:String                          = "MMM dd";
    static let __MMM_dd__hh_mm_a:String                          = "MMM dd - hh:mm a";
    static let __dd_MMM__hh_mm_a:String              = "dd MMM, hh:mm a";
    
    static let __dd_MMMM_yyyy_hh_mm_ss:String        = "dd MMMM yyyy hh:mm:ss";
    static let __yyyy_MM_dd_hh_mm_ss:String          = "yyyy-MM-dd hh:mm:ss";
    static let __yyyy_MM_dd_HH_mm_ss:String          = "yyyy-MM-dd HH:mm:ss";
    static let __dd_MM_yyyy_HH_mm:String          = "dd-MM-yyyy HH:mm";
    static let __dd_MM_yyyy_hh_mm_a:String          = "dd-MM-yyyy hh:mm a";
    static let __yyyy_MM_dd_HH_mm_a:String           = "yyyy-MM-dd HH:mm a";
    static let __yyyy_MM_dd_HH_mm_ss_a:String        = "yyyy-MM-dd HH:mm:ss a";
    static let __yyyy_MM_dd_hh_mm_ss_a:String        = "yyyy-MM-dd hh:mm:ss a";
    static let __dd_MMM_yyyy_hh_mm_a:String          = "dd MMM yyyy hh:mm a";
    static let __EEE_dd_MMM_yyyy_HH_mm_ss_ZZZ:String = "EEE, dd MMM yyyy HH:mm:ss ZZZ";
    static let __HH_mm_a__EEEE_dd_MM_yyyy:String     = "hh:mm a, EEEE dd-MM-yyyy";
    static let __dd_MMM_yyyy:String                  = "dd MMM yyyy";
    static let __dd_MMM_at_yyyy_HH_mm_a:String       = "dd MMM yyyy @ HH:mm a";
    static let __dd_MMM_at_yyyy_hh_mm_a:String       = "dd MMM yyyy @ hh:mm a";
    static let __HH_mm_ZZZ:String                    = "HH:mm ZZZ";
    static let __HH_mm_a:String                      = "HH:mm a";
    static let __HH_mm:String                      = "HH:mm";
    static let __HH_mm_ss:String                     = "HH:mm:ss";
    static let __hh_mm_ss:String                     = "hh:mm:ss";
    static let __hh_mm_ss_a:String                   = "hh:mm:ss a";
    static let __hh_mm_a:String                      = "hh:mm a";
    
    
    // MARK: - App Language
    public let kAppCurrentLanguage = "appCurrentLanguage"
    public let kAppCurrentLanguage__English = "appCurrentLanguageEnglish"
    public let kAppCurrentLanguage__Urdu = "appCurrentLanguageUrdu"
    
    // Application Language
    public let kApplicationLanguage_English = "en"
    public let kApplicationLanguage_urdu = "ur"
    
    
    // MARK: -  Common
    public let kInvisibleSignChar:String = "\u{200B}"
    
    // MARK: -  First Time App Loaded
    public let kIsFirstTimeAppLoad:String = "isFirstTimeAppLoad"
    
    // MARK: - Mime Types
    public let MimeType__TEXT_Plain:String = "text/plain"
    public let MimeType__TEXT_JSON:String = "text/json"
    
    
    // MARK: - User Password Minimum Length
    public let kValidationRestriction__UserPasswordMinimumLength: Int = 6
   // public var location = LocationModel()
    
    
    // MARK: - Colors
    // Application Color Scheme
    public let kColor__AppColorScheme_Orange:String = "#FCB203"
    
    public let kColor__AppColorScheme_NavBackGroundColor:String = "#019AE8"//Set Done
    public let kColor__AppColorScheme_NavBackButtonColor:String = "#FFFFFF"//Set Done
    
    // TextView
    public let kColor__AppColorScheme_TextViewBackground:String = "#84E1EA"
    public let kColor__AppColorScheme_TextViewBorder:String = "#FFFFFF"
    public let kColor__AppColorScheme_TextViewPlaceHolderColor:String = "#677479"
    public let kColor__AppColorScheme_TextViewTextColor:String = "#FFFFFF"
    public let kColor__AppColorScheme_TableRowSelectionColor:String = "#83B0BB"
    
    public let colorForTextBoxPlaceHolder:String = "C7C7CC"
    public let colorForTextBoxBorders:String = "E7E7E7"
    
    // Validation Color
    public let kColor__Message:String = "#1085DB"
    public let kColor__Success:String = "#1B934B"
    public let kColor__Warning:String = "FEC536"
    public let kColor__Error:String   = "#D23935"
    
    // Attributed Label
    public let kColor_AttributedLabel_LinkUnderLineText:String = "#FFFFFF"
    public let kColor_AttributedLabel_LinkUnderLine:String = "#FFFFFF"
    
    // Validation Type
    public let kAlertPopUpType__Message:Int                 = 1
    public let kAlertPopUpType__Success:Int                 = 2
    public let kAlertPopUpType__Warning:Int                 = 3
    public let kAlertPopUpType__Error:Int                   = 4
    
    public var timer = Timer()
    
    public var IslogOut = true
    public var isSidelog = false
    public var isSideGarage = false
    
    // MARK: -  Scope
    public let kHeader__app_x_www_form_urlencoded:String = "application/x-www-form-urlencoded"
    public let kHeader__app_json:String                  = "application/json; charset=utf-8"
    
    
    
    // MARK: - Touch On Status Bar Notification
    public let kTouchOnStatusBarNotification:String = "touchOnStatusBar"
    
    // MARK: - Segues Identifiers
    public let from_login_to_home = "from_login_to_home"
    
    public static func ShowAlert(view: UIViewController,message:String,Title:String)
    {
        let alert = UIAlertController(title: Title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
            print(message)
        }))
        view.present(alert, animated: true, completion: nil)
    }
}

