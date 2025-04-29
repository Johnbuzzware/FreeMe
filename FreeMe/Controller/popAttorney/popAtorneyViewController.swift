//
//  popAtorneyViewController.swift
//  FreeMe
//
//  Created by Asad's Mac on 18/02/2025.
//

import UIKit

class popAtorneyViewController: UIViewController {

    @IBOutlet weak var lbldetails: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpClickableLabel()

        // Do any additional setup after loading the view.
    }
    
    func setUpClickableLabel() {
        let fullText = """
        As part of your application, Lawpay will verify your info and request payment details. Lawpay Privacy Policy.
        """
        let termsText = "Lawpay Privacy Policy"

        let attributedString = NSMutableAttributedString(string: fullText)
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemBlue,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]

        // Add attributes to specific parts of the string
        if let termsRange = fullText.range(of: termsText) {
            attributedString.addAttributes(attributes, range: NSRange(termsRange, in: fullText))
        }

        lbldetails.attributedText = attributedString
        lbldetails.isUserInteractionEnabled = true
        lbldetails.numberOfLines = 0 // Allows for multi-line text

        // Add padding with constraints


        // Add a tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapOnLabel(_:)))
        lbldetails.addGestureRecognizer(tapGesture)
    }

    @objc func handleTapOnLabel(_ gesture: UITapGestureRecognizer) {
        guard let text = lbldetails.attributedText?.string else { return }

        // Detect which part of the label was tapped
        let termsRange = (text as NSString).range(of: "Lawpay Privacy Policy")

        let tapLocation = gesture.location(in: lbldetails)
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize(width: lbldetails.bounds.width, height: .greatestFiniteMagnitude))
        let textStorage = NSTextStorage(attributedString: lbldetails.attributedText!)

        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)

        textContainer.lineFragmentPadding = 0
        textContainer.maximumNumberOfLines = lbldetails.numberOfLines
        textContainer.lineBreakMode = lbldetails.lineBreakMode

        let index = layoutManager.glyphIndex(for: tapLocation, in: textContainer)

        if NSLocationInRange(index, termsRange) {
            print("Terms of Service tapped")
            // Handle the action for Terms of Service
        }
    }


}
