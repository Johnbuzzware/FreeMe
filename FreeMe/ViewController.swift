//
//  ViewController.swift
//  FreeMe
//
//  Created by Asad's Mac on 14/02/2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnsignUp(_ sender: Any) {
        
        let vc = UIStoryboard.storyBoard(withName: .main).loadViewControllerss(withIdentifier: "SignUpViewController")
        self.navigationController?.pushViewController(vc, animated: true)
        

    }
    
    @IBAction func btnlogin(_ sender: Any) {
        
        let vc = UIStoryboard.storyBoard(withName: .main).loadViewControllerss(withIdentifier: "LoginViewController")
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
}

