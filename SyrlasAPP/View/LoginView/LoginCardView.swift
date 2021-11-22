//
//  LoginCardView.swift
//  SyrlasAPP
//
//  Created by Tanirbergen Kaldibai on 13.03.2021.
//

import UIKit

class LoginCardView: UIView, SetupView {
    
    // MARK: - Properties
    lazy var emailTextField = UITextField()
    lazy var passwordTextField = UITextField()
    lazy var loginButton = UIButton(type: .system)
    lazy var label = UILabel()
    
    lazy var stackCardLoginView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            label,
            emailTextField,
            passwordTextField,
            loginButton
        ])
        
        sv.axis = .vertical
        sv.spacing = 12
        return sv
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    func setupView() {
        [stackCardLoginView].forEach {
            addSubview($0)
        }
        
        stackCardLoginView.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 32, bottom: 0, right: 32))
        stackCardLoginView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        configureView()
        setupAction()
    }
    
    func configureView() {
        backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "Syrlas".uppercased()
        emailTextField.configureTextField(placeholder: "EmailID", cornerRadius: 12, textColor: .black, font: "RalewayBold", fontSize: 16, height: 50, textAlignment: .center)
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor.syrlasLight.cgColor
        passwordTextField.configureTextField(placeholder: "Password", cornerRadius: 12, textColor: .black, font: "RalewayBold", fontSize: 16, height: 50, textAlignment: .center)
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.syrlasLight.cgColor
        passwordTextField.isSecureTextEntry = true
        loginButton.configureButton(title: "LOGIN", titleColor: .white, isEnabled: true, cornerRadius: 16, borderWidth: 0, borderColor: UIColor.clear.cgColor, height: 60, backgroundColor: .syrlasGreen)
    }
    
    func setupAction() {
        
        loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    }
    
    @objc func handleLogin(){
        
        UserDefaults.standard.setValue(emailTextField.text, forKey: "userlogin")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
