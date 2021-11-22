//
//  ViewController.swift
//  SyrlasAPP
//
//  Created by Tanirbergen Kaldibai on 13.03.2021.
//

import UIKit

class SplashViewController: UIViewController, SetupView {
    // MARK: - Properties
    lazy var splashView = SplashConfigureView()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupView()
    }
    
    // MARK: - Methods
    func setupView() {
        [splashView].forEach {
            view.addSubview($0)
        }
        splashView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        configureView()
        setupAction()
    }
    
    func configureView() {
        view.backgroundColor = .white
        configureNavigationBar(isHidden: true, backgroundColor: .clear, title: "")
    }
    
    func setupAction() {
        splashView.loginButton.addTarget(self, action: #selector(hanldeShowLogin), for: .touchUpInside)
    }
    
    @objc fileprivate func hanldeShowLogin() {
        let vc = LoginViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

