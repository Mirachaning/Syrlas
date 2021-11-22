//
//  ResultFakeViewController.swift
//  SyrlasAPP
//
//  Created by Tanirbergen Kaldibai on 13.03.2021.
//

import UIKit

class ResultFakeViewController: UIViewController {
    
    let image = UIImageView(image: #imageLiteral(resourceName: "Снимок экрана 2021-03-13 в 05.55.31").withRenderingMode(.alwaysOriginal))

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(image)
        image.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
}

class AlertFakeViewController: UIViewController {
    
    let image = UIImageView(image: #imageLiteral(resourceName: "image0.png").withRenderingMode(.alwaysOriginal))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(image)
        image.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
}
