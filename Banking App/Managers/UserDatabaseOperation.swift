//
//  UserDatabaseOperations.swift
//  Banking App
//
//  Created by Wesley Otero on 6/3/20.
//  Copyright © 2020 Wesley Otero. All rights reserved.
//

import Foundation
import SQLite3

class UserDatabseOperation {
    
    private static let databse = DatabaseManager.openDatabase()
    
    static func createUserTable() {
        var sqlStatement: OpaquePointer? // Will capture the prepared SQLite3 statement to be ultimately used
        let queryString = SQLQuery.createUserTable.rawValue
        
        if sqlite3_prepare_v2(databse, queryString, -1, &sqlStatement, nil) == SQLITE_OK {
            if sqlite3_step(sqlStatement) == SQLITE_DONE {
                debugPrint("User Table Created")
            } else {
                debugPrint("\(queryString): FAILED")
            }
        }
        sqlite3_finalize(sqlStatement)
    }
    
    static func createUser(firstName: NSString, lastName: NSString, login: NSString, password: NSString) {
        var insertStatement: OpaquePointer?
        let queryString = SQLQuery.insertUserRecord.rawValue
        
        if sqlite3_prepare_v2(databse, queryString, -1, &insertStatement, nil) == SQLITE_OK {
            let accountID: Int32 = 1000
            let accountBalance: Int32 = 10
            let accountCurrentBalance: Int32 = 10
            
            sqlite3_bind_text(insertStatement, 2, login.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, password.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, firstName.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 5, lastName.utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 6, accountID)
            sqlite3_bind_int(insertStatement, 7, accountBalance)
            sqlite3_bind_int(insertStatement, 8, accountCurrentBalance)
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                debugPrint("Record Inserted")
            }
        }
    }
    
    static func getAllUsers() {
        var selectStatement: OpaquePointer?
        let queryString = SQLQuery.selectAllUsers.rawValue
        
        
        if sqlite3_prepare_v2(databse, queryString, -1, &selectStatement, nil) == SQLITE_OK {
            if sqlite3_step(selectStatement) == SQLITE_ROW {
                
                let id = sqlite3_column_int(selectStatement, 0)
                
            }
        }
    }
    
}
