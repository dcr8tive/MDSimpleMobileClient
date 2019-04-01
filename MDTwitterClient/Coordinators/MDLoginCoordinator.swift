//
//  MDLoginCoordinator.swift
//  MDTwitterClient
//
//  Created by MDLE on 2019-03-30.
//  Copyright © 2019 dcre8tive. All rights reserved.
//

import Foundation
import UIKit

class MDLoginCoordinator: NSObject, MDCoordinator, UINavigationControllerDelegate {
    var childCoordinators = [MDCoordinator]()
    var navigationController: UINavigationController
    var isLoggedIn: Bool = false
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        let auth = MDAuthenticationService()
        auth.attemp { (status) in
            switch (status) {
            case .completed:
                self.showTwitterBoard()
            case .error(_):
                self.showLogin()
            }
        }
    }
    
    func showLogin() {
        let vc = MDLoginViewController.instantiate()
        vc.coordinator = self
        navigationController.setViewControllers([vc], animated: false)
    }
    
    func showTwitterBoard() {
        let child = MDTwitterCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func removeCoordinator(_ child: MDCoordinator) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
            }
        }
    }
}


extension MDLoginCoordinator: Authentification {

}
