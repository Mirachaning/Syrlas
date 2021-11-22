//
//  MainTopView.swift
//  SyrlasAPP
//
//  Created by Tanirbergen Kaldibai on 13.03.2021.
//

import UIKit

class MainTopView: UIView, SetupView {
    
    lazy var rightImage = UIImageView(image: #imageLiteral(resourceName: "Componente_6_2").withRenderingMode(.alwaysOriginal))
    lazy var userImage = UIImageView(image: #imageLiteral(resourceName: "profile-img").withRenderingMode(.alwaysOriginal))
    lazy var settingImage = UIImageView(image: #imageLiteral(resourceName: "icons8-settings").withRenderingMode(.alwaysOriginal))
    lazy var translateImage = UIImageView(image: #imageLiteral(resourceName: "icons8-translation").withRenderingMode(.alwaysOriginal))
    lazy var alertsImage = UIImageView(image: #imageLiteral(resourceName: "alert-2").withRenderingMode(.alwaysOriginal))
    lazy var upgradeImage = UIImageView(image: #imageLiteral(resourceName: "remove_ads-2").withRenderingMode(.alwaysOriginal))
    
    /// labels
    lazy var userName = UILabel()
    lazy var alertLabel = UIButton()
    lazy var upgradeLabel = UILabel()
    
    lazy var userStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            userName
        ])
        sv.axis = .horizontal
        sv.spacing = 12
        return sv
    }()
    
    lazy var stackAlertView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            alertLabel
        ])
        sv.axis = .horizontal
        sv.spacing = 12
        return sv
    }()
    
    lazy var stackUpgradeView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            upgradeLabel
        ])
        sv.axis = .horizontal
        sv.spacing = 12
        return sv
    }()
    
    lazy var bottomStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            stackAlertView,
            stackUpgradeView
        ])
        sv.axis = .vertical
        sv.spacing = 32
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    func setupView() {
        
        [userImage, rightImage, userStackView, bottomStackView].forEach {
            addSubview($0)
        }
        
        
        rightImage.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor)
        userImage.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 80, left: 20, bottom: 0, right: 0))
        userStackView.anchor(top: nil, leading: userImage.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        userStackView.centerYAnchor.constraint(equalTo: userImage.centerYAnchor).isActive = true
        bottomStackView.anchor(top: userStackView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 30, left: 20, bottom: 0, right: 0))
        configureView()
        setupAction()
    }
    
    func configureView() {
        backgroundColor = .white
        userName.configureLabel(text: "MARY OLSON", textColor: .black, textAlignment: .natural, fontName: "", fontSize: 24, numberOfLines: 0)
        alertLabel.setTitleColor(.black, for: .normal)
        alertLabel.setTitle("Alerts", for: .normal)
        alertLabel.addTarget(self, action: #selector(handleAlert), for: .touchUpInside)
        upgradeLabel.configureLabel(text: "Upgrade account", textColor: .black, textAlignment: .natural, fontName: "", fontSize: 24, numberOfLines: 0)
    }
    
    func setupAction() {
        
    }
    
    @objc func handleAlert() {
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
           
            let vc = AlertFakeViewController()
            topController.present(vc, animated: true)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
