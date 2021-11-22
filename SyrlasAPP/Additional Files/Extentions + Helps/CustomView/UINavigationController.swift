//
//  UINavigationController.swift
//  SyrlasAPP
//
//  Created by Tanirbergen Kaldibai on 13.03.2021.
//

import UIKit

extension UIViewController {
    
    func configureNavigationBar(isHidden: Bool, backgroundColor: UIColor,title: String) {
        self.navigationController?.navigationBar.isHidden = isHidden
        self.navigationController?.navigationBar.backgroundColor = backgroundColor
        self.navigationController?.navigationItem.title = title
    }
}
