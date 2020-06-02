//
//  AccountsVC.swift
//  Banking App
//
//  Created by Wesley Otero on 6/1/20.
//  Copyright © 2020 Wesley Otero. All rights reserved.
//

import UIKit

class AccountsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}

extension AccountsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Account") as! AccountTableViewCell
        
        return cell
    }
    
    
}
