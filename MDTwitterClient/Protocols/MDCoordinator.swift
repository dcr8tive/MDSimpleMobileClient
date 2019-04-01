//
//  MDCoordinator.swift
//  MDTwitterClient
//
//  Created by MDLE on 2019-03-30.
//  Copyright © 2019 dcre8tive. All rights reserved.
//

import Foundation
import UIKit

protocol MDCoordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var childCoordinators: [MDCoordinator] { get set }
    
    func start()
}
