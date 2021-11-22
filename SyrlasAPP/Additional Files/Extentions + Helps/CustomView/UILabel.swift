//
//  UILabel.swift
//  SyrlasAPP
//
//  Created by Tanirbergen Kaldibai on 13.03.2021.
//

import UIKit

extension UILabel {
    func configureLabel(text: String, textColor: UIColor, textAlignment: NSTextAlignment, fontName: String, fontSize: CGFloat, numberOfLines: Int) {
        self.text = text
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.font = UIFont(name: fontName, size: fontSize)
        self.numberOfLines = numberOfLines
    }
}
