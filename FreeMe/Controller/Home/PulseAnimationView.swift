//
//  PulseAnimationView.swift
//  LifeLink
//
//  Created by Mac on 22/12/2023.
//

import Foundation
import UIKit

import UIKit



class PulsatingCirclesView: UIView {

    private var pulsatingLayers: [CAShapeLayer] = []
    private var isAnimating = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupPulsatingCircles()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .clear
        setupPulsatingCircles()
    }

    private func setupPulsatingCircles() {
        let mainCircle = UIView(frame: bounds)
        mainCircle.layer.cornerRadius = bounds.width / 2
        mainCircle.layer.borderColor = UIColor().colorsFromAsset(name: .pulseBlue).cgColor
        addSubview(mainCircle)

        // Create three pulsating layers
        pulsatingLayers.append(createPulsatingLayer(delay: 0, inset: 0))  // First layer
        pulsatingLayers.append(createPulsatingLayer(delay: 0.5, inset: 10)) // Second layer
        pulsatingLayers.append(createPulsatingLayer(delay: 1.0, inset: 20)) // Third layer
    }

    private func createPulsatingLayer(delay: CFTimeInterval, inset: CGFloat) -> CAShapeLayer {
        let fadeLayer = CAShapeLayer()
        fadeLayer.frame = bounds
        fadeLayer.fillColor = UIColor().colorsFromAsset(name: .pulseBlue).cgColor
        layer.addSublayer(fadeLayer)

        let circlePath = UIBezierPath(ovalIn: bounds.insetBy(dx: inset, dy: inset))
        fadeLayer.path = circlePath.cgPath

        return fadeLayer
    }

    func startAnimation() {
        guard !isAnimating else { return } // Prevent starting animation multiple times
        isAnimating = true
        
        for (index, fadeLayer) in pulsatingLayers.enumerated() {
            let animationGroup = CAAnimationGroup()
            animationGroup.duration = 2.0
            animationGroup.repeatCount = .infinity
            animationGroup.beginTime = CACurrentMediaTime() + (Double(index) * 0.5)

            let opacityAnimation = CABasicAnimation(keyPath: "opacity")
            opacityAnimation.fromValue = 1.0
            opacityAnimation.toValue = 0.0

            let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
            scaleAnimation.fromValue = 1.0
            scaleAnimation.toValue = 2.0

            animationGroup.animations = [opacityAnimation, scaleAnimation]

            fadeLayer.add(animationGroup, forKey: "pulsating")
        }
    }

    func stopAnimation() {
        guard isAnimating else { return } // Prevent stopping animation if not running
        isAnimating = false
        
        for fadeLayer in pulsatingLayers {
            fadeLayer.removeAnimation(forKey: "pulsating")
        }
    }
}


class PulsatingCirclesRedView: UIView {

    private var pulsatingLayers: [CAShapeLayer] = []
    private var isAnimating = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupPulsatingCircles()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .clear
        setupPulsatingCircles()
    }

    private func setupPulsatingCircles() {
        let mainCircle = UIView(frame: bounds)
        mainCircle.layer.cornerRadius = bounds.width / 2
        mainCircle.layer.borderColor = UIColor().colorsFromAsset(name: .redColor).cgColor
        addSubview(mainCircle)

        // Create three pulsating layers
        pulsatingLayers.append(createPulsatingLayer(delay: 0, inset: 0))  // First layer
        pulsatingLayers.append(createPulsatingLayer(delay: 0.5, inset: 10)) // Second layer
        pulsatingLayers.append(createPulsatingLayer(delay: 1.0, inset: 20)) // Third layer
    }

    private func createPulsatingLayer(delay: CFTimeInterval, inset: CGFloat) -> CAShapeLayer {
        let fadeLayer = CAShapeLayer()
        fadeLayer.frame = bounds
        fadeLayer.fillColor = UIColor().colorsFromAsset(name: .redColor).cgColor
        layer.addSublayer(fadeLayer)

        let circlePath = UIBezierPath(ovalIn: bounds.insetBy(dx: inset, dy: inset))
        fadeLayer.path = circlePath.cgPath

        return fadeLayer
    }

    func startAnimation() {
        guard !isAnimating else { return } // Prevent starting animation multiple times
        isAnimating = true
        
        for (index, fadeLayer) in pulsatingLayers.enumerated() {
            let animationGroup = CAAnimationGroup()
            animationGroup.duration = 2.0
            animationGroup.repeatCount = .infinity
            animationGroup.beginTime = CACurrentMediaTime() + (Double(index) * 0.5)

            let opacityAnimation = CABasicAnimation(keyPath: "opacity")
            opacityAnimation.fromValue = 1.0
            opacityAnimation.toValue = 0.0

            let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
            scaleAnimation.fromValue = 1.0
            scaleAnimation.toValue = 2.0

            animationGroup.animations = [opacityAnimation, scaleAnimation]

            fadeLayer.add(animationGroup, forKey: "pulsating")
        }
    }

    func stopAnimation() {
        guard isAnimating else { return } // Prevent stopping animation if not running
        isAnimating = false
        
        for fadeLayer in pulsatingLayers {
            fadeLayer.removeAnimation(forKey: "pulsating")
        }
    }
}

