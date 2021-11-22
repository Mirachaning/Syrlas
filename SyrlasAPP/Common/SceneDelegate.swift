//
//  SceneDelegate.swift
//  SyrlasAPP
//
//  Created by Tanirbergen Kaldibai on 13.03.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: scene.coordinateSpace.bounds)
        window?.windowScene = scene
        if UserDefaults.standard.string(forKey: "userlogin") == nil {
            let navigationController = UINavigationController(rootViewController: SplashViewController())
            window?.rootViewController = navigationController
        } else {
            let navigationController = UINavigationController(rootViewController: SyrlasTabBarViewController())
            window?.rootViewController = navigationController
        }
        window?.makeKeyAndVisible()
    }
}

