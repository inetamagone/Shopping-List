//
//  AppDelegate.swift
//  Shopping-List
//
//  Created by ineta.magone on 16/03/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let mainController = makeMainViewController()
        navigationController = UINavigationController(rootViewController: mainController)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

private extension AppDelegate {
    func makeMainViewController() -> UIViewController {
        let mainController = MainViewController()
        let mainModel = MainViewModel()
        
        let editController = self.makeEditViewController()
        mainModel.onCreateItem = { [ weak self ] in
            guard let self = self else { return }
            self.navigationController?.pushViewController(editController, animated: true)
        }
        mainController.configure(mainModel: mainModel)
        return mainController
    }
    
    func makeCreateViewController() -> UIViewController {
        let createController = CreateViewController()
        let createModel = CreateViewModel()
        
        createController.configure(createModel: createModel)
        return createController
    }
    
    func makeEditViewController() -> UIViewController {
        let editController = EditViewController()
        let editModel = EditViewModel()
        
        editController.configure(editModel: editModel)
        return editController
    }
}

