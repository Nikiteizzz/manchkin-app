//
//  AppCoordinatorProtocol.swift
//  manchkinApp
//
//  Created by Никита Хорошко on 16.08.22.
//

import UIKit

class AppCoordinator : Coordinator {
    var navigationController: UINavigationController
    var name:String = ""
    
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = StartViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showMainGameView() {
        let viewController = MainGameViewViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
}
