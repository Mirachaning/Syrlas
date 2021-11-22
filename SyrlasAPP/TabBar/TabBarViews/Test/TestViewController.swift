//
//  TestViewController.swift
//  SyrlasAPP
//
//  Created by Tanirbergen Kaldibai on 13.03.2021.
//

import UIKit

class TestViewController: UIViewController {
    
    lazy var firstImage = UIImageView(image: #imageLiteral(resourceName: "binge-eating 2").withRenderingMode(.alwaysOriginal))
    lazy var secondImage = UIImageView(image: #imageLiteral(resourceName: "Снимок экрана 2021-03-13 в 06.11.58").withRenderingMode(.alwaysOriginal))

    override func viewDidLoad() {
        super.viewDidLoad()
        [firstImage, secondImage].forEach {
            view.addSubview($0)
        }
        
        firstImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        secondImage.anchor(top: firstImage.safeAreaLayoutGuide.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 40, bottom: 100, right: 40))
        view.backgroundColor = .white
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
