//
//  AccountTableViewCell.swift
//  Banking App
//
//  Created by Wesley Otero on 6/1/20.
//  Copyright © 2020 Wesley Otero. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {

    @IBOutlet weak var accountName: UILabel!
    @IBOutlet weak var accountNumberShort: UILabel!
    @IBOutlet weak var currentBalance: UILabel!
    @IBOutlet weak var availableBalance: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
