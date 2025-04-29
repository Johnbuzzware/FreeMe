//
//  HomeViewController.swift
//  FreeMe
//
//  Created by Asad's Mac on 17/02/2025.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var stopImage: UIImageView!
    @IBOutlet weak var ivstopPulseView: PulsatingCirclesRedView!
    
    @IBOutlet weak var ivStopView: UIView!
    
    @IBOutlet weak var ivInitialView: UIView!
    @IBOutlet weak var ivRunView: PulsatingCirclesView!
    
    @IBOutlet weak var ivRunImage: UIImageView!
    
    @IBOutlet weak var lbltop: UILabel!
    
    @IBOutlet weak var lbldetails: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ivStopView.isHidden = true
        
        self.ivInitialView.isHidden = false
        self.ivRunView.startAnimation()

        
        self.lbltop.text = "Legal emergency?"
        self.lbldetails.text = "Tap the button to activate alerts and begin recording."

        let imagetap = UITapGestureRecognizer(target: self, action: #selector(self.stopImage(sender:)))
        self.ivRunImage.isUserInteractionEnabled = true
        self.ivRunImage.addGestureRecognizer(imagetap)

        let imagetarrp = UITapGestureRecognizer(target: self, action: #selector(self.runImage(sender:)))
        self.stopImage.isUserInteractionEnabled = true
        self.stopImage.addGestureRecognizer(imagetarrp)
        // Do any additional setup after loading the view.
    }
    
    @objc func stopImage(sender: UITapGestureRecognizer) {
        
        self.ivInitialView.isHidden = true
        self.ivstopPulseView.startAnimation()
        self.ivRunView.stopAnimation()

        self.ivStopView.isHidden = false
        
        self.lbltop.text = "False alarm?"
        self.lbldetails.text = "Tap the button to let your contacts know urgent assistance is no longer needed."
    }
    
    @objc func runImage(sender: UITapGestureRecognizer) {
        
        self.ivInitialView.isHidden = false
        
        self.ivstopPulseView.stopAnimation()
        
        self.ivRunView.startAnimation()

        self.ivStopView.isHidden = true
        
        self.lbltop.text = "Legal emergency?"
        self.lbldetails.text = "Tap the button to activate alerts and begin recording."
    }
}
