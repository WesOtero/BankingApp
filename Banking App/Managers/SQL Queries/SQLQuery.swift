//
//  SQLQueries.swift
//  Banking App
//
//  Created by Wesley Otero on 6/2/20.
//  Copyright © 2020 Wesley Otero. All rights reserved.
//

import Foundation

enum SQLQuery: String {
    
    case createUserTable = "CREATE TABLE user(user_id INT PRIMARY KEY NOT NULL, user_login CHAR(255), password CHAR(255), first_name CHAR(255), last_name CHAR(255), account_id INT, account_balance INT, account_current_balance INT)"
    case createAccountTable = "CREATE TABLE account(id INT PRIMARY KEY NOT NULL)"
    case insertUserRecord = "INSERT INTO user (user_id, user_login, password, first_name, last_name, account_id, account_balance, account_current_balance) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
    
}
