//
//  LoginViewController.swift
//  FreeMe
//
//  Created by Asad's Mac on 17/02/2025.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var ivloginView: UIView!
    
    @IBOutlet weak var ivEmailView: UIView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.ivEmailView.isHidden = true
        self.ivloginView.isHidden = false
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnhange(_ sender: Any) {
        
        self.ivloginView.isHidden = true
        self.ivEmailView.isHidden = false
        
    }
    
    @IBAction func btnsign(_ sender: Any) {
        
        
        
        
        let vc = UIStoryboard.storyBoard(withName: .Home).loadViewControllerss(withIdentifier: "LgSideMenu")
        UIApplication.shared.windows.first?.rootViewController = vc
        
        
    }

}
