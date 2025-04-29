//
//  SignUpViewController.swift
//  FreeMe
//
//  Created by Asad's Mac on 17/02/2025.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var lblterms: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpClickableLabel()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnsign(_ sender: Any) {
        
        let vc = UIStoryboard.storyBoard(withName: .Home).loadViewControllerss(withIdentifier: "LgSideMenu")
        UIApplication.shared.windows.first?.rootViewController = vc
    }
    @IBAction func btnlogn(_ sender: Any) {
        
        let vc = UIStoryboard.storyBoard(withName: .main).loadViewControllerss(withIdentifier: "LoginViewController")
        self.navigationController?.pushViewController(vc, animated: true)
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
