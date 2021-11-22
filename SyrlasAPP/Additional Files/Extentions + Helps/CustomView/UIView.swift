//
//  UIView.swift
//  SyrlasAPP
//
//  Created by Tanirbergen Kaldibai on 13.03.2021.
//

import UIKit

extension UIView {
    
    func configureSizeView(height: CGFloat, width: CGFloat) {
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func configureLayerView(radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
    
    func configureView(color: UIColor) {
        self.backgroundColor = color
    }
    
    func setupBlureEffect() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds

        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        addSubview(blurEffectView)
    }
    
    func removeBlureEffect() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = .zero

        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        addSubview(blurEffectView)
    }
}
