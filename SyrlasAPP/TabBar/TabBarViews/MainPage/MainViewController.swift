//
//  MainViewController.swift
//  SyrlasAPP
//
//  Created by Tanirbergen Kaldibai on 13.03.2021.
//

import UIKit

class MainViewController: UIViewController, SetupView {
    
    lazy var topView = MainTopView()
    lazy var iWantEatButton = UIButton(type: .system)
    lazy var mainMealsButton = UIButton(type: .system)
    
    lazy var stackButton: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            iWantEatButton,
            mainMealsButton
        ])
        sv.axis = .vertical
        sv.spacing = 12
        sv.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return sv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        [topView, stackButton].forEach {
            view.addSubview($0)
        }
        topView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        topView.heightAnchor.constraint(equalToConstant: view.frame.size.height / 2).isActive = true
        stackButton.anchor(top: topView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 12, left: 20, bottom: 0, right: 0))
        configureView()
        setupAction()
    }
    
    func configureView() {
        view.backgroundColor = .syrlasLight
        iWantEatButton.configureButton(title: "I want to eat", titleColor: .white, isEnabled: true, cornerRadius: 12, borderWidth: 0, borderColor: UIColor.clear.cgColor, height: 40, backgroundColor: .syrlasGreen)
        mainMealsButton.configureButton(title: "main meals", titleColor: .white, isEnabled: true, cornerRadius: 12, borderWidth: 0, borderColor: UIColor.clear.cgColor, height: 40, backgroundColor: .syrlasGreen)
    }
    
    func setupAction() {
        iWantEatButton.addTarget(self, action: #selector(handleShowChat), for: .touchUpInside)
    }
    
    @objc fileprivate func handleShowChat() {
        let vc = ChatViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
