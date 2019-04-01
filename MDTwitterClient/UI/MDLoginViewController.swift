//
//  MDLoginViewController.swift
//  MDTwitterClient
//
//  Created by MDLE on 2019-03-30.
//  Copyright © 2019 dcre8tive. All rights reserved.
//

import UIKit

protocol Authentification {
    
}

class MDLoginViewController: UIViewController, MDStoryboardable {

    weak var coordinator:MDLoginCoordinator?
    
    @IBOutlet weak var txtfldUserName: UITextField!
    @IBOutlet weak var txtfldUserPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        guard let user = txtfldUserName.text, let pass = txtfldUserPassword.text, !user.isEmpty, !pass.isEmpty else {
            //Show alert with missing required values
            self.showError(message: Key.ErrorMessage.validationError)
            return
        }

        let auth = MDAuthenticationService()
        auth.login(user: user, pass: pass) { (status) in
            switch(status) {
            case .completed:
                self.coordinator?.showTwitterBoard()
            case .error(_):
                self.showError(message: Key.ErrorMessage.validationUserPassword)
            }
        }

    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: "Login Error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

