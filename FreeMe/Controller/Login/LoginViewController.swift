//
//  LoginViewController.swift
//  FreeMe
//
//  Created by Asad's Mac on 17/02/2025.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var ivloginView: UIView!
    
    @IBOutlet weak var lblemail: UILabel!
    @IBOutlet weak var ivEmailView: UIView!
    @IBOutlet weak var ivimageuser: UIImageView!
    
    @IBOutlet weak var lblname: UILabel!
    
    @IBOutlet weak var tfemail: UITextField!
    
    @IBOutlet weak var tfpassword: UITextField!
    
    
    @IBOutlet weak var btncheck: UIButton!
    
    var iskeep = false
    
    var isEmaillogin = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tfpassword.isSecureTextEntry = true
        
        if let email = CommonHelper.getCachedUserData(){
            if !email.email.isEmpty{
                self.isEmaillogin = false
                self.ivEmailView.isHidden = true
                self.ivloginView.isHidden = false
                
                
                self.ivimageuser.imageURLProfile(email.imageUrl ?? "")
                self.lblname.text = email.Name ?? ""
                self.lblemail.text = email.email ?? ""
                
            }
            else{
                self.isEmaillogin = true
                self.ivloginView.isHidden = true
                self.ivEmailView.isHidden = false
            }
            
                        
        }
        else{
            self.isEmaillogin = true
            self.ivloginView.isHidden = true
            self.ivEmailView.isHidden = false
            
            
        }


        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btneye(_ sender: Any) {
        
        self.tfpassword.isSecureTextEntry.toggle()

    }
    
    
    @IBAction func btnhange(_ sender: Any) {
        
        self.ivloginView.isHidden = true
        self.ivEmailView.isHidden = false
        self.isEmaillogin = true

        
        
    }
    
    
    @IBAction func btnforgotpassword(_ sender: Any) {
        
        PopupHelper.alertWithFieldForget(title: "Forgot Password?", message: "Please enter your registered email to get password reset link.", controller: self)

        
        
    }
    
    
    func fogetPassword(_ email:String){
        
        PopupHelper.showAnimating(self)
        FirebaseData.ResetPassword(email: email) { error in
            if let error = error {
                self.stopAnimating()
                PopupHelper.showAlertControllerWithError(forErrorMessage: error.localizedDescription, forViewController: self)
            }
            else{
                
                self.stopAnimating()
                PopupHelper.showAlertControllerWithSucces(forErrorMessage: "Password reset link has been sent to your email address.", forViewController: self)
            }
        }
        
    }
    
    
    @IBAction func btnchecklogin(_ sender: Any) {
        
        self.iskeep.toggle()
        self.btncheck.setImage(UIImage(systemName: self.iskeep ? "checkmark.square.fill" : "checkmark.square"), for: .normal)
        
    }
    
    @IBAction func btnsign(_ sender: Any) {
        
        
        PopupHelper.showAnimating(self)
        
        if self.isEmaillogin{
            
            if self.tfpassword.isValid() && self.tfemail.isValid(){
                FirebaseData.loginWithEmail(email: self.tfemail.text!, password: self.tfpassword.text!) { error in
                    
                    if let error = error{
                        self.stopAnimating()
                        PopupHelper.showAlertControllerWithError(forErrorMessage: error.localizedDescription, forViewController: self)
                    }
                    else{
                        FirebaseData.getUserData(uid: FirebaseData.getCurrentUserId()) { error, userData in
                            self.stopAnimating()
                            if let data = userData{
                                if self.iskeep{
                                    CommonHelper.saveCachedUserData(userData: data)
                                }
                                let vc = UIStoryboard.storyBoard(withName: .Home).loadViewControllerss(withIdentifier: "LgSideMenu")
                                UIApplication.shared.windows.first?.rootViewController = vc
                            }
                            
                        }
                    }
                }

            }
            else{
                self.stopAnimating()
                PopupHelper.showAlertControllerWithError(forErrorMessage: "Please enter valid email and password", forViewController: self)
            }

        }
        else{
            
            if let email = CommonHelper.getCachedUserData(){
                
                if self.tfpassword.isValid(){
                    FirebaseData.loginWithEmail(email: email.email ?? "", password: self.tfpassword.text!) { error in
                        
                        if let error = error{
                            self.stopAnimating()
                            PopupHelper.showAlertControllerWithError(forErrorMessage: error.localizedDescription, forViewController: self)
                        }
                        else{
                            self.stopAnimating()
                            let vc = UIStoryboard.storyBoard(withName: .Home).loadViewControllerss(withIdentifier: "LgSideMenu")
                            UIApplication.shared.windows.first?.rootViewController = vc
                        }
                    }
                }
                else{
                    self.stopAnimating()
                    PopupHelper.showAlertControllerWithError(forErrorMessage: "Please enter password", forViewController: self)
                }
              

            }
        }
        
        
    }

}
