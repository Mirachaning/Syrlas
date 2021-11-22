//
//  UIButton.swift
//  SyrlasAPP
//
//  Created by Tanirbergen Kaldibai on 13.03.2021.
//

import UIKit

extension UIButton {
    
    @discardableResult
    func configureButton(title: String, titleColor: UIColor, isEnabled: Bool, cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: CGColor, height: CGFloat,backgroundColor: UIColor) -> UIButton{
        let button = UIButton(type: .system)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.isEnabled = isEnabled
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        self.backgroundColor = backgroundColor
        return button
    }
    
    func buttonRightImage(image: UIImage, renderMode: UIImage.RenderingMode){
        self.setImage(image.withRenderingMode(renderMode), for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 35)
        self.contentHorizontalAlignment = .right
        self.imageView?.contentMode = .scaleAspectFit
    }
    
    func buttonLeftImage(image: UIImage, renderMode: UIImage.RenderingMode){
        self.setImage(image.withRenderingMode(renderMode), for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        self.contentHorizontalAlignment = .left
        self.imageView?.contentMode = .scaleAspectFit
    }
    
    func buttonTitlePadding(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        titleEdgeInsets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
}

extension UIView {
    
    func shadowView() {
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 3
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        self.layer.shadowColor = UIColor.lightGray.cgColor
    }
    
    func hideShadowView() {
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 0
        self.layer.shadowOpacity = 0
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowColor = UIColor.syrlasLight.cgColor
    }
}
