//
//  SplashView.swift
//  SyrlasAPP
//
//  Created by Tanirbergen Kaldibai on 13.03.2021.
//

import UIKit

class SplashConfigureView: UIView, SetupView {
    // MARK: - Properties
    lazy var logoImage = UIImageView(image: #imageLiteral(resourceName: "logo").withRenderingMode(.alwaysOriginal))
    private let welcomeLabel = UILabel()
    private let welcomeVerticalLabel = UILabel()
    private let cardImage = UIImageView(image: #imageLiteral(resourceName: "Group 120").withRenderingMode(.alwaysOriginal))
    lazy var loginButton = UIButton(type: .system)
    lazy var signUpButton = UIButton(type: .system)
    
    lazy var welcomeStack: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            welcomeLabel,
            welcomeVerticalLabel
        ])
        sv.axis = .vertical
        sv.spacing = 4
        return sv
    }()
    
    lazy var stackButton: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            loginButton,
            signUpButton
        ])
        sv.axis = .vertical
        sv.spacing = 8
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    // MARK: - Methods
    func setupView() {
        [logoImage, welcomeStack, cardImage, stackButton].forEach {
            addSubview($0)
        }
        logoImage.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 40, left: 0, bottom: 0, right: 0))
        logoImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        welcomeStack.anchor(top: logoImage.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 80, left: 0, bottom: 0, right: 0))
        welcomeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cardImage.anchor(top: welcomeStack.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: -44, bottom: 0, right: -55))
        stackButton.anchor(top: nil, leading: leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 80, bottom: 40, right: 80))
        configureView()
        setupAction()
    }
    
    func configureView() {
        welcomeLabel.configureLabel(text: "Hello dear friend!", textColor: .black, textAlignment: .center, fontName: "RalewayBold", fontSize: 25, numberOfLines: 0)
        welcomeVerticalLabel.configureLabel(text: "Let's discuss how you are doing ^^", textColor: .black, textAlignment: .center, fontName: "RalewayBold", fontSize: 25, numberOfLines: 0)
        loginButton.configureButton(title: "LOGIN", titleColor: .white, isEnabled: true, cornerRadius: 20, borderWidth: 0, borderColor: UIColor.clear.cgColor, height: 50, backgroundColor: .syrlasPerple)
        signUpButton.configureButton(title: "SIGN UP", titleColor: .white, isEnabled: true, cornerRadius: 20, borderWidth: 0, borderColor: UIColor.clear.cgColor, height: 50, backgroundColor: .syrlasPerple)
        cardImage.contentMode = .scaleAspectFill
    }
    
    func setupAction() {
        /// someAction
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
