//
//  LoginViewController.swift
//  SyrlasAPP
//
//  Created by Tanirbergen Kaldibai on 13.03.2021.
//

import UIKit

class LoginViewController: UIViewController, SetupView {
    // MARK: - Properties
    private let backButton = UIButton(type: .system)
    
    lazy var topView = LoginTopView()
    lazy var cardview = LoginCardView()
    lazy var bottomView = LoginBottomView()
    
    // MARK: - StackView
    lazy var loginStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            topView,
            cardview,
            bottomView
        ])
        sv.axis = .vertical
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        
        [backButton, loginStackView].forEach {
            view.addSubview($0)
        }
        
        /// button position
        backButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 30, left: 25, bottom: 0, right: 0))
        
        loginStackView.anchor(top: backButton.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0))
        
        configureView()
        setupAction()
    }
    
    // MARK: - Methods
    func configureView() {
        view.backgroundColor = .white
        configureNavigationBar(isHidden: true, backgroundColor: .clear, title: "")
        
        /// configure button
        backButton.configureButton(title: "", titleColor: .clear, isEnabled: true, cornerRadius: 9, borderWidth: 0, borderColor: UIColor.clear.cgColor, height: 40, backgroundColor: .white)
        backButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.setImage(#imageLiteral(resourceName: "ic_back").withRenderingMode(.alwaysOriginal), for: .normal)
        backButton.shadowView()
    }
    
    func setupAction() {
        backButton.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        cardview.loginButton.addTarget(self, action: #selector(handleMainPage), for: .touchUpInside)
    }
    
    @objc fileprivate func handleBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc fileprivate func handleMainPage() {
        let vc = SyrlasTabBarViewController()
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
