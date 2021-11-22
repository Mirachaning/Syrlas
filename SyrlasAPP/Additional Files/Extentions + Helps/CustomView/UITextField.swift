//
//  UITextField.swift
//  SyrlasAPP
//
//  Created by Tanirbergen Kaldibai on 13.03.2021.
//

import UIKit

extension UITextField {
    
    func configureTextField(placeholder: String, cornerRadius: CGFloat, textColor: UIColor, font: String, fontSize: CGFloat,height: CGFloat,textAlignment: NSTextAlignment) {
        self.placeholder = placeholder
        self.layer.cornerRadius = cornerRadius
        self.textColor = textColor
        self.font = UIFont(name: font, size: fontSize)
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        self.textAlignment = textAlignment
    }
    
    func configureTextFieldBackground(backgroundColor: UIColor, borderWidth: CGFloat, borderColor: CGColor, placeholderText: String, placeholderColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        self.attributedPlaceholder = NSAttributedString(string: placeholderText,
                                                        attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
    }
    
    func setupTextFieldShadow() {
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 3
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.layer.shadowColor = UIColor.lightGray.cgColor
    }
    
    func setupLeftImageToTextField(imageName: String) {
        self.leftViewMode = UITextField.ViewMode.always
        let imageView     = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let image         = UIImage(named: imageName)
        imageView.image   = image
        leftView          = imageView
    }
    
    func setupLeftLabelToTextField(string: String, left: CGFloat) {
        self.leftViewMode = UITextField.ViewMode.always
        //let label         = UILabel(frame: CGRect(x: -20, y: -30, width: 50, height: 20))
        text        = string
       // leftView          = label
    }
}
