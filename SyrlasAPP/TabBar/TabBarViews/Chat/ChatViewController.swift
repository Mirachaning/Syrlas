//
//  ChatViewController.swift
//  SyrlasAPP
//
//  Created by Tanirbergen Kaldibai on 13.03.2021.
//

import UIKit
import FirebaseDatabase

class ChatViewController: UIViewController, SetupView {
    
    lazy var adminImage = UIImageView(image: #imageLiteral(resourceName: "Group 92").withRenderingMode(.alwaysOriginal))
    lazy var questionLabel = UILabel()
    lazy var yesButton = UIButton(type: .system)
    lazy var noButton = UIButton(type: .system)
    lazy var iamNotSureButton = UIButton(type: .system)
    
    var action: [String] = []
    var ref: DatabaseReference!
    
    lazy var stackQuestions: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            adminImage
        ])
        sv.axis = .horizontal
        sv.spacing = 12
        return sv
    }()
    
    lazy var stackFirstQuestionButton: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            yesButton,
            noButton,
            iamNotSureButton
        ])
        sv.spacing = 16
        sv.axis = .vertical
        return sv
    }()
    
    /// answers
    lazy var ansYesButton = UIButton(type: .system)
    
    /// newAnswer
    lazy var secondImage = UIImageView(image: #imageLiteral(resourceName: "Group 92").withRenderingMode(.alwaysOriginal))
    lazy var secondQuestionLabel = UILabel()
    lazy var borderButton = UIButton(type: .system)
    lazy var angryButton = UIButton(type: .system)
    lazy var sadButton = UIButton(type: .system)
    
    lazy var secondQuestionStack: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            borderButton,
            angryButton,
            sadButton
        ])
        sv.axis = .vertical
        sv.spacing = 12
        return sv
    }()
    
    /// sad
    lazy var sadShowButton = UIButton(type: .system)
    lazy var lastQuestionLabel = UILabel()
    lazy var lastYes = UIButton(type: .system)
    lazy var lastNo = UIButton(type: .system)
    
    lazy var stackQuestionsLast: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            lastQuestionLabel,
            lastYes,
            lastNo
        ])
        sv.axis = .vertical
        sv.spacing = 8
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        
        [stackQuestions, stackFirstQuestionButton, questionLabel].forEach {
            view.addSubview($0)
        }
        
        stackQuestions.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 60, left: 20, bottom: 0, right: 0))
        questionLabel.anchor(top: nil, leading: stackQuestions.trailingAnchor, bottom: nil, trailing: nil,padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        questionLabel.centerYAnchor.constraint(equalTo: stackQuestions.centerYAnchor).isActive = true
        
        stackFirstQuestionButton.anchor(top: stackQuestions.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 20, bottom: 0, right: 0))
        
        configureView()
        setupAction()
    }
    
    func configureView() {
        configureNavigationBar(isHidden: true, backgroundColor: .clear, title: "")
        view.backgroundColor = .white
        
        questionLabel.configureLabel(text: "Are you hungry right now?", textColor: .black, textAlignment: .natural, fontName: "", fontSize: 24, numberOfLines: 0)
        yesButton.configureButton(title: "Yes", titleColor: .black, isEnabled: true, cornerRadius: 16, borderWidth: 0, borderColor: UIColor.clear.cgColor, height: 40, backgroundColor: #colorLiteral(red: 0.8409731984, green: 0.878710568, blue: 0.973338306, alpha: 1))
        noButton.configureButton(title: "No", titleColor: .black, isEnabled: true, cornerRadius: 16, borderWidth: 0, borderColor: UIColor.clear.cgColor, height: 40, backgroundColor: #colorLiteral(red: 0.8409731984, green: 0.878710568, blue: 0.973338306, alpha: 1))
        iamNotSureButton.configureButton(title: "i am not sure", titleColor: .black, isEnabled: true, cornerRadius: 16, borderWidth: 0, borderColor: UIColor.clear.cgColor, height: 40, backgroundColor: #colorLiteral(red: 0.8409731984, green: 0.878710568, blue: 0.973338306, alpha: 1))
    }
    
    func setupAction() {
        yesButton.addTarget(self, action: #selector(handleYesShow), for: .touchUpInside)
        sadButton.addTarget(self, action: #selector(handleSadShow), for: .touchUpInside)
        lastYes.addTarget(self, action: #selector(handleShowResult), for: .touchUpInside)
    }
    
    @objc fileprivate func handleYesShow() {
        action.append("IsHungry - Yes")
        UIView.animate(withDuration: 0.5) { [self] in
            [ansYesButton].forEach {
                view.addSubview($0)
            }
            
            ansYesButton.anchor(top: iamNotSureButton.bottomAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 20))
            ansYesButton.configureButton(title: "Yes", titleColor: .black, isEnabled: false, cornerRadius: 16, borderWidth: 0, borderColor: UIColor.clear.cgColor, height: 40, backgroundColor: #colorLiteral(red: 0.4574027061, green: 0.6951172948, blue: 1, alpha: 1))
            ansYesButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
            ansYesButton.layoutIfNeeded()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                [secondImage, secondQuestionLabel, secondQuestionStack].forEach {
                    view.addSubview($0)
                }
                
                secondImage.anchor(top: ansYesButton.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 20, bottom: 0, right: 0))
                secondQuestionLabel.anchor(top: nil, leading: secondImage.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 20, bottom: 0, right: 20))
                secondQuestionLabel.centerYAnchor.constraint(equalTo: secondImage.centerYAnchor).isActive = true
                
                secondQuestionStack.anchor(top: secondQuestionLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 00, bottom: 0, right: 0))
                
                secondQuestionLabel.configureLabel(text: "What are you feeling right now?", textColor: .black, textAlignment: .natural, fontName: "", fontSize: 24, numberOfLines: 0)
                
                borderButton.configureButton(title: "Bored", titleColor: .black, isEnabled: true, cornerRadius: 16, borderWidth: 0, borderColor: UIColor.clear.cgColor, height: 40, backgroundColor: #colorLiteral(red: 0.8409731984, green: 0.878710568, blue: 0.973338306, alpha: 1))
                angryButton.configureButton(title: "Angry", titleColor: .black, isEnabled: true, cornerRadius: 16, borderWidth: 0, borderColor: UIColor.clear.cgColor, height: 40, backgroundColor: #colorLiteral(red: 0.8409731984, green: 0.878710568, blue: 0.973338306, alpha: 1))
                sadButton.configureButton(title: "Sad", titleColor: .black, isEnabled: true, cornerRadius: 16, borderWidth: 0, borderColor: UIColor.clear.cgColor, height: 40, backgroundColor: #colorLiteral(red: 0.8409731984, green: 0.878710568, blue: 0.973338306, alpha: 1))
                sadButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
                stackFirstQuestionButton.layoutIfNeeded()
                secondImage.layoutIfNeeded()
                secondQuestionLabel.layoutIfNeeded()
            }
        }
    }
    
    @objc fileprivate func handleSadShow() {
        action.append("Feeling - Sad")
        
        UIView.animate(withDuration: 0.5) { [self] in
            [sadShowButton].forEach {
                view.addSubview($0)
            }
            sadShowButton.anchor(top: sadButton.bottomAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 20))
            sadShowButton.configureButton(title: "Sad", titleColor: .black, isEnabled: false, cornerRadius: 16, borderWidth: 0, borderColor: UIColor.clear.cgColor, height: 40, backgroundColor: #colorLiteral(red: 0.4574027061, green: 0.6951172948, blue: 1, alpha: 1))
            sadShowButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
            sadShowButton.layoutIfNeeded()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            [stackQuestionsLast].forEach {
                view.addSubview($0)
                
                stackQuestionsLast.anchor(top: sadShowButton.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 20, bottom: 0, right: 0))
                lastQuestionLabel.configureLabel(text: "Are you sure you want a snack?", textColor: .black, textAlignment: .natural, fontName: "", fontSize: 24, numberOfLines: 0)
                lastYes.configureButton(title: "YES", titleColor: .black, isEnabled: true, cornerRadius: 16, borderWidth: 0, borderColor: UIColor.clear.cgColor, height: 40, backgroundColor: #colorLiteral(red: 0.8409731984, green: 0.878710568, blue: 0.973338306, alpha: 1))
                lastNo.configureButton(title: "NO", titleColor: .black, isEnabled: true, cornerRadius: 16, borderWidth: 0, borderColor: UIColor.clear.cgColor, height: 40, backgroundColor: #colorLiteral(red: 0.8409731984, green: 0.878710568, blue: 0.973338306, alpha: 1))
            }
        }
    }
    
    @objc fileprivate func handleShowResult() {
        action.append("Want Snuck - Yes")
        
        let vc = ResultFakeViewController()
        ref = Database.database().reference()
        
        let login = UserDefaults.standard.string(forKey: "userlogin")!
        
        var time = Date()
        
        self.ref.child("users").child(login).child("data").setValue(["\(time)": action])
        
        present(vc, animated: true)
    }
}
