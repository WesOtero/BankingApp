//
//  LoginVC.swift
//  Banking App
//
//  Created by Wesley Otero on 6/1/20.
//  Copyright © 2020 Wesley Otero. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DatabaseManager.createTable()
        DatabaseManager.insert()
        
    }
    
    @IBAction func login(_ sender: Any) {
        if isUserAuthenticated() {
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let mainViewController = storyboard.instantiateViewController(identifier: "Main") as UITabBarController
            mainViewController.modalPresentationStyle = .fullScreen
            present(mainViewController, animated: true, completion: nil)
        } else {
            debugPrint(isUserAuthenticated())
        }
    }
    
    // MARK: TODO  
    func isUserAuthenticated() -> Bool {
        return true
    }
    
}
