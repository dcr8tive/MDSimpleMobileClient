//
//  MDTwitterCoordinator.swift
//  MDTwitterClient
//
//  Created by MDLE on 2019-03-31.
//  Copyright © 2019 dcre8tive. All rights reserved.
//

import Foundation
import UIKit

class MDTwitterCoordinator: MDCoordinator {
    var navigationController: UINavigationController
    var childCoordinators = [MDCoordinator]()
    weak var parentCoordinator: MDLoginCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = MDTwitterViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func didFinishShowing() {
        parentCoordinator?.removeCoordinator(self)
        //Let's log current user out
        let auth = MDAuthenticationService()
        auth.logout()
        parentCoordinator?.showLogin()
    }
}
