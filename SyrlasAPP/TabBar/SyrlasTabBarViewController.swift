//
//  SyrlasTabBarViewController.swift
//  SyrlasAPP
//
//  Created by Tanirbergen Kaldibai on 13.03.2021.
//

import UIKit

class SyrlasTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        guard let fromView = selectedViewController?.view, let toView = viewController.view else {
          return false // Make sure you want this as false
        }

        if fromView != toView {
          UIView.transition(from: fromView, to: toView, duration: 0.3, options: [.transitionCrossDissolve], completion: nil)
        }

        return true
    }
    
    override func viewDidLoad() {
        navigationController?.navigationBar.isHidden = true
        setupViewControllers()
        delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = true
    }
    
    fileprivate func setupViewControllers(){
        navigationController?.navigationBar.isHidden = true
        tabBar.barTintColor = .white
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
        
        let main = templateNavController(rootViewController: MainViewController(), unSelectedImg:#imageLiteral(resourceName: "icons8-news").withRenderingMode(.alwaysOriginal),selectedImg: #imageLiteral(resourceName: "icons8-news").withRenderingMode(.alwaysOriginal))
        let second = templateNavController(rootViewController: DetailViewController(), unSelectedImg:#imageLiteral(resourceName: "Vector (2)").withRenderingMode(.alwaysOriginal),selectedImg: #imageLiteral(resourceName: "Vector (2)").withRenderingMode(.alwaysOriginal))
        let third = templateNavController(rootViewController: TestViewController(), unSelectedImg:#imageLiteral(resourceName: "icons8-increase").withRenderingMode(.alwaysOriginal),selectedImg: #imageLiteral(resourceName: "icons8-increase").withRenderingMode(.alwaysOriginal))
        let profile = templateNavController(rootViewController: ProfileViewController(), unSelectedImg:#imageLiteral(resourceName: "Group 87").withRenderingMode(.alwaysOriginal),selectedImg: #imageLiteral(resourceName: "Group 87").withRenderingMode(.alwaysOriginal))
        
            viewControllers = [main, second, third, profile]
    }
    
    func templateNavController(rootViewController: UIViewController,unSelectedImg: UIImage,selectedImg: UIImage) -> UINavigationController{
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.image = unSelectedImg
        navController.tabBarItem.selectedImage = selectedImg
        navigationController?.navigationBar.isHidden = true
       // navigationController?.navigationBar.isTranslucent = true
        return navController
    }
}
