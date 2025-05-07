//
//  SignUpViewController.swift
//  FreeMe
//
//  Created by Asad's Mac on 17/02/2025.
//

import UIKit

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var lblterms: UILabel!
    
    @IBOutlet weak var tfemail: UITextField!
    
    @IBOutlet weak var tfpassword: UITextField!
    
    
    @IBOutlet weak var lbleightcharacter: UILabel!
    
    @IBOutlet weak var lblonelower: UILabel!
    
    @IBOutlet weak var lbloneupper: UILabel!
    
    @IBOutlet weak var lblonenumber: UILabel!
    
    @IBOutlet weak var lblonespecail: UILabel!
    
    
    @IBOutlet weak var iveightImage:UIImageView!
    @IBOutlet weak var ivoneLowerImage:UIImageView!
    @IBOutlet weak var ivoneUpperImage:UIImageView!
    @IBOutlet weak var ivonenumberImage:UIImageView!
    @IBOutlet weak var ivspecialImage:UIImageView!

    var isPasswordValid = false
    
    //image correct = Icon akar-circle-check-1
    //image wrong = Icon akar-circle-check
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpClickableLabel()
        self.tfpassword.isSecureTextEntry = true

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btneye(_ sender: Any) {
        
        
        self.tfpassword.isSecureTextEntry.toggle()
        
    }
    @IBAction func btnsign(_ sender: Any) {
        
        
        self.signupUser()
        
       // let vc = UIStoryboard.storyBoard(withName: .Home).loadViewControllerss(withIdentifier: "LgSideMenu")
       // UIApplication.shared.windows.first?.rootViewController = vc
    }
    
    func signupUser(){
        
        
        if self.isPasswordValid{
            if self.tfemail.isValid(){
                PopupHelper.showAnimating(self)
                let usermodel = UserModel()
                usermodel.email = self.tfemail.text ?? ""
                usermodel.password = self.tfpassword.text ?? ""
                usermodel.Name = "No name"
                usermodel.imageUrl = ""
                
                FirebaseData.RegisterWithEmailPassword(email: self.tfemail.text!, password: self.tfpassword.text!) { error in
                    
                    if let error = error{
                        self.stopAnimating()
                        PopupHelper.showAlertControllerWithError(forErrorMessage: error.localizedDescription, forViewController: self)
                    }
                    else{
                        
                        FirebaseData.saveUserData(uid: FirebaseData.getCurrentUserId(), userData: usermodel) { error in
                            if let error = error{
                                self.stopAnimating()
                                PopupHelper.showAlertControllerWithError(forErrorMessage: error.localizedDescription, forViewController: self)
                            }
                            else{
                                self.stopAnimating()
                                self.navigationController?.popToRootViewController(animated: true)
                            }
                        }
                        
                    }
                    
                }
            }
            else{
                PopupHelper.showAlertControllerWithError(forErrorMessage: "Please enter valid email", forViewController: self)

            }
            
        }
        else{
            PopupHelper.showAlertControllerWithError(forErrorMessage: "Please enter valid password", forViewController: self)
        }
        
        
        
    }
    
    
    @IBAction func tfpasswrodChanged(_ sender: UITextField) {
        
        guard let password = sender.text else { return }
        
        // Validation flags
        let hasEightCharacters = password.count >= 8
        let hasLowercase = password.range(of: "[a-z]", options: .regularExpression) != nil
        let hasUppercase = password.range(of: "[A-Z]", options: .regularExpression) != nil
        let hasNumber = password.range(of: "[0-9]", options: .regularExpression) != nil
        let hasSpecial = password.range(of: "[^A-Za-z0-9]", options: .regularExpression) != nil
        
        // Update UI
        updateValidationUI(isValid: hasEightCharacters, label: lbleightcharacter, imageView: iveightImage)
        updateValidationUI(isValid: hasLowercase, label: lblonelower, imageView: ivoneLowerImage)
        updateValidationUI(isValid: hasUppercase, label: lbloneupper, imageView: ivoneUpperImage)
        updateValidationUI(isValid: hasNumber, label: lblonenumber, imageView: ivonenumberImage)
        updateValidationUI(isValid: hasSpecial, label: lblonespecail, imageView: ivspecialImage)

        // Set overall validity
        isPasswordValid = hasEightCharacters && hasLowercase && hasUppercase && hasNumber && hasSpecial
        
        
        
        
    }
    
    func updateValidationUI(isValid: Bool, label: UILabel, imageView: UIImageView) {
        if isValid {
            label.textColor = UIColor().colorsFromAsset(name: .greenColor)
            imageView.image = UIImage(named: "Icon akar-circle-check-1")
        } else {
            label.textColor = UIColor().colorsFromAsset(name: .redColor) // default color
            imageView.image = UIImage(named: "Icon akar-circle-check")
        }
    }
    
    
    
    func setUpClickableLabel() {
        let fullText = """
        By continuing, you agree to Free-Me Terms of Service. We will manage information about you as described in our Privacy Policy and Cookie Policy.
        """
        let termsText = "Terms of Service"
        let privacyText = "Privacy Policy"
        let cookieText = "Cookie Policy"

        let attributedString = NSMutableAttributedString(string: fullText)
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemBlue,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]

        // Add attributes to specific parts of the string
        if let termsRange = fullText.range(of: termsText) {
            attributedString.addAttributes(attributes, range: NSRange(termsRange, in: fullText))
        }
        if let privacyRange = fullText.range(of: privacyText) {
            attributedString.addAttributes(attributes, range: NSRange(privacyRange, in: fullText))
        }
        if let cookieRange = fullText.range(of: cookieText) {
            attributedString.addAttributes(attributes, range: NSRange(cookieRange, in: fullText))
        }

        lblterms.attributedText = attributedString
        lblterms.isUserInteractionEnabled = true
        lblterms.numberOfLines = 0 // Allows for multi-line text

        // Add padding with constraints
        lblterms.translatesAutoresizingMaskIntoConstraints = false
        lblterms.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        lblterms.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true

        // Add a tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapOnLabel(_:)))
        lblterms.addGestureRecognizer(tapGesture)
    }

    @objc func handleTapOnLabel(_ gesture: UITapGestureRecognizer) {
        guard let text = lblterms.attributedText?.string else { return }

        // Detect which part of the label was tapped
        let termsRange = (text as NSString).range(of: "Terms of Service")
        let privacyRange = (text as NSString).range(of: "Privacy Policy")
        let cookieRange = (text as NSString).range(of: "Cookie Policy")

        let tapLocation = gesture.location(in: lblterms)
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize(width: lblterms.bounds.width, height: .greatestFiniteMagnitude))
        let textStorage = NSTextStorage(attributedString: lblterms.attributedText!)

        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)

        textContainer.lineFragmentPadding = 0
        textContainer.maximumNumberOfLines = lblterms.numberOfLines
        textContainer.lineBreakMode = lblterms.lineBreakMode

        let index = layoutManager.glyphIndex(for: tapLocation, in: textContainer)

        if NSLocationInRange(index, termsRange) {
            print("Terms of Service tapped")
            // Handle the action for Terms of Service
        } else if NSLocationInRange(index, privacyRange) {
            print("Privacy Policy tapped")
            // Handle the action for Privacy Policy
        } else if NSLocationInRange(index, cookieRange) {
            print("Cookie Policy tapped")
            // Handle the action for Cookie Policy
        }
    }

}
