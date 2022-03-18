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
        
        let createController = self.makeCreateViewController(mainController: mainController)
        mainModel.onCreateItem = { [ weak self ] in
            guard let self = self else { return }
            self.navigationController?.pushViewController(createController, animated: true)
        }
        mainModel.onEditItem = { [ weak self ] itemIndex in
            guard let self = self else { return }
            let editController = self.makeEditViewController(mainController: mainController, itemIndex: itemIndex)
            self.navigationController?.pushViewController(editController, animated: true)
        }
        mainController.configure(mainModel: mainModel)
        return mainController
    }
    
    func makeCreateViewController(mainController: MainViewController) -> UIViewController {
        let createController = CreateViewController()
        let createModel = CreateViewModel()
        
        createModel.onReturn = { [weak self] in
            mainController.reloadTableView()
            self?.navigationController?.popViewController(animated: true)
        }
        
        createController.configure(createModel: createModel)
        return createController
    }
    
    func makeEditViewController(mainController: MainViewController, itemIndex: Int) -> UIViewController {
        let editController = EditViewController()
        let editModel = EditViewModel()
        
        editModel.getItem(at: itemIndex)
        editModel.onReturn = { [weak self] in
            mainController.reloadTableView()
            self?.navigationController?.popViewController(animated: true)
        }
        editController.configure(editModel: editModel)
        return editController
    }
}

