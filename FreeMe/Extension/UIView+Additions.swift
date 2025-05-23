//
//  UIView+Additions.swift
//  TradeAir
//
//  Created by Adeel on 17/09/2019.
//  Copyright © 2019 Buzzware. All rights reserved.
//

import UIKit
import ChameleonFramework

class UIView_Additions: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(gradientStyle: .topToBottom, withFrame: self.frame, andColors: [UIColor().colorsFromAsset(name: .bgColor),UIColor().colorsFromAsset(name: .bgColor)])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = UIColor(gradientStyle: .topToBottom, withFrame: self.frame, andColors: [UIColor().colorsFromAsset(name: .bgColor),UIColor().colorsFromAsset(name: .bgColor)])
    }
}

extension UIView {
    
//    @IBInspectable
//    var backgroundImage: UIImage {
//        get {
//            return UIImage(named: "dashbg")!
//        }
//        set {
//            backgroundColor = UIColor.init(patternImage: newValue)
//        }
//    }
        @IBInspectable
        var cornerRadius: CGFloat {
            get {
                return layer.cornerRadius
            }
            set {
                layer.cornerRadius = newValue
            }
        }
    
        @IBInspectable
        var borderWidth: CGFloat {
            get {
                return layer.borderWidth
            }
            set {
                layer.borderWidth = newValue
            }
        }
    
        @IBInspectable
        var borderColor: UIColor? {
            get {
                if let color = layer.borderColor {
                    return UIColor(cgColor: color)
                }
                return nil
            }
            set {
                if let color = newValue {
                    layer.borderColor = color.cgColor
                } else {
                    layer.borderColor = nil
                }
            }
        }
    
        @IBInspectable
        var shadowRadius: CGFloat {
            get {
                return layer.shadowRadius
            }
            set {
                layer.shadowRadius = newValue
            }
        }
    
        @IBInspectable
        var shadowOpacity: Float {
            get {
                return layer.shadowOpacity
            }
            set {
                layer.shadowOpacity = newValue
            }
        }
    
        @IBInspectable
        var shadowOffset: CGSize {
            get {
                return layer.shadowOffset
            }
            set {
                layer.shadowOffset = newValue
            }
        }
    
        @IBInspectable
        var shadowColor: UIColor? {
            get {
                if let color = layer.shadowColor {
                    return UIColor(cgColor: color)
                }
                return nil
            }
            set {
                if let color = newValue {
                    layer.shadowColor = color.cgColor
                } else {
                    layer.shadowColor = nil
                }
            }
        }
    @IBInspectable
    var maskToBounds: Bool {
        get {
            return layer.masksToBounds
        }
        set {
            layer.masksToBounds = newValue
        }
    }
}
extension UIView{
    class func loadFromNibNamed(_ nibNamed: String, bundle : Bundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
    
    //
    func sunriseGradientBackground(_ direction: GradientDirection = .topBottom, startAlpha:CGFloat = 1, endAlpha:CGFloat = 1) {
        removeExistingGradientLayer()
        let gradient        = CAGradientLayer()
        gradient.name       = "gradient"
        gradient.masksToBounds  = true
        gradient.frame      = CGRect(origin: CGPoint.zero, size: CGSize(width: frame.width+500, height: frame.height))
        //        gradient.frame = self.frame
        
        
        //      135 Degree
        //        1st #007061 #009485 #00C4B0
        
        gradient.colors = [UIColor(hex: "#007061").cgColor,
                           UIColor(hex: "#009485").cgColor,
                           UIColor(hex: "#00C4B0").cgColor]
        
        gradient.locations  = [0,1,1]
        switch direction {
        case .topBottom: break
        case .leftRight: gradient.startPoint = CGPoint(x: 0, y: 0.5); gradient.endPoint = CGPoint(x: 1, y: 0.5)
        case .rightLeft: gradient.startPoint = CGPoint(x: 1, y: 0.5); gradient.endPoint = CGPoint(x: 0, y: 0.5)
        }
        layer.insertSublayer(gradient, at: 0)
    }
    
    func removeExistingGradientLayer() {
        if layer.sublayers != nil {
            for l in layer.sublayers! {
                if l is CAGradientLayer && (l as! CAGradientLayer).name == "gradient" {
                    (l as! CAGradientLayer).removeFromSuperlayer()
                }
            }
        }
    }
    
    func setGradient(colors: [CGColor], angle: Float = 0) {
        let gradientLayerView: UIView = UIView(frame: CGRect(x:0, y: 0, width: bounds.width, height: bounds.height))
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = gradientLayerView.bounds
        gradient.colors = colors
        
        let alpha: Float = angle / 360
        //        let startPointX = powf(
        //            sinf(2 * Float.pi * ((alpha + 0.75) / 2)),
        //            2
        //        )
        //        let startPointY = powf(
        //            sinf(2 * Float.pi * ((alpha + 0) / 2)),
        //            2
        //        )
        //        let endPointX = powf(
        //            sinf(2 * Float.pi * ((alpha + 0.25) / 2)),
        //            2
        //        )
        //        let endPointY = powf(
        //            sinf(2 * Float.pi * ((alpha + 0.5) / 2)),
        //            2
        //        )
        
        gradient.endPoint = CGPoint(x: CGFloat(0),y: CGFloat(0))
        gradient.startPoint = CGPoint(x: CGFloat(1), y: CGFloat(1))
        
        gradientLayerView.layer.insertSublayer(gradient, at: 0)
        layer.insertSublayer(gradientLayerView.layer, at: 0)
    }
    
    func makeCircle() {
        layer.cornerRadius      = max(frame.size.height, frame.size.width) / 2
        layer.masksToBounds     = true
    }
    
    class func autoHeight(_ view: UIView, constraint: NSLayoutConstraint) {
        constraint.constant = view.sizeThatFits(CGSize(width: view.frame.size.width, height: CGFloat(MAXFLOAT))).height
    }
    
    class func autoWidth(_ view: UIView, constraint: NSLayoutConstraint) {
        constraint.constant = view.sizeThatFits(CGSize(width: CGFloat(MAXFLOAT), height: view.frame.size.height)).width
    }
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 1
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
      layer.masksToBounds = false
      layer.shadowColor = color.cgColor
      layer.shadowOpacity = opacity
      layer.shadowOffset = offSet
      layer.shadowRadius = radius
        layer.masksToBounds = true
      layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
      layer.shouldRasterize = true
      layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
extension UIView{
    enum roundingCorner {
        case top,bottom,left,right
    }
    func drawCorner(roundTo: roundingCorner){
        switch roundTo {
        case .top:
            return self.layer.maskedCorners =  [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        case .bottom:
            return self.layer.maskedCorners =  [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        case .left:
            return self.layer.maskedCorners =  [.layerMinXMinYCorner,.layerMinXMaxYCorner]
        case .right:
            return self.layer.maskedCorners =  [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
        
        }
    }
    enum roundingCorners {
        case topRight,topLeft,bottomLeft,bottomRight
    }
    func drawThreeCorner(roundTo: roundingCorners){
        switch roundTo {
        case .topRight:
            return self.layer.maskedCorners =  [.layerMinXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        case .topLeft:
            return self.layer.maskedCorners =  [.layerMinXMaxYCorner,.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
        case .bottomLeft:
            return self.layer.maskedCorners =  [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
        case .bottomRight:
            return self.layer.maskedCorners =  [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner]
        
        }
    }

 
    func drawOneCorner(corners: UIRectCorner, radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
            let mask = _round(corners: corners, radius: radius)
            addBorder(mask: mask, borderColor: borderColor, borderWidth: borderWidth)
        }
    @discardableResult func _round(corners: UIRectCorner, radius: CGFloat) -> CAShapeLayer {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
            return mask
        }
        
        func addBorder(mask: CAShapeLayer, borderColor: UIColor, borderWidth: CGFloat) {
            let borderLayer = CAShapeLayer()
            borderLayer.path = mask.path
            borderLayer.fillColor = UIColor.clear.cgColor
            borderLayer.strokeColor = UIColor.clear.cgColor
            borderLayer.lineWidth = borderWidth
            borderLayer.frame = bounds
            layer.addSublayer(borderLayer)
        }
    public class func fromNib<T: UIView>(from bundle: Bundle = Bundle.main) -> T {
        return bundle.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
      }
}

