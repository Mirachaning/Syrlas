//
//  LoginTopView.swift
//  SyrlasAPP
//
//  Created by Tanirbergen Kaldibai on 13.03.2021.
//

import UIKit

class LoginTopView: UIView, SetupView {
    // MARK: - Properties
    lazy var topViewImage = UIImageView(image: #imageLiteral(resourceName: "LoginPageImage").withRenderingMode(.alwaysOriginal))

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    func setupView() {
        heightAnchor.constraint(equalToConstant: 240).isActive = true
        [topViewImage].forEach {
            addSubview($0)
        }
        
        topViewImage.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        configureView()
        setupAction()
    }
    
    func configureView() {
        
    }
    
    func setupAction() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
