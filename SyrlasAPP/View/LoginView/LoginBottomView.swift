//
//  LoginBottomView.swift
//  SyrlasAPP
//
//  Created by Tanirbergen Kaldibai on 13.03.2021.
//

import UIKit

class LoginBottomView: UIView, SetupView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    func setupView() {
        configureView()
        setupAction()
    }
    
    func configureView() {
        heightAnchor.constraint(equalToConstant: 120).isActive = true
        backgroundColor = .syrlasGreen
    }
    
    func setupAction() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
