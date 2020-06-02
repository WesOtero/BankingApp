//
//  DatabaseConnectionManager.swift
//  Banking App
//
//  Created by Wesley Otero on 5/31/20.
//  Copyright © 2020 Wesley Otero. All rights reserved.
//

import Foundation

import SQLite3

class DatabaseManager {
    
    static func openDatabase() -> OpaquePointer? {
        var db: OpaquePointer? // The value that will be captured to interact with the database
        let dbPath = try! FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create:  true).appendingPathComponent("test.sqlite")
        
        debugPrint("Dtabase Path: \(dbPath)")
        
        if sqlite3_open(dbPath.path, &db) == SQLITE_OK {
            return db
        } else {
            // MARK: TODO Display an application error.
            return nil
        }
        
    }
    
    static func createTable() {
        var sqlStatement: OpaquePointer? // Will capture the prepared SQLite3 statement to be ultimately used
        let queryString = SQLQuery.createUserTable.rawValue
        
        if sqlite3_prepare_v2(openDatabase(), queryString, -1, &sqlStatement, nil) == SQLITE_OK {
            if sqlite3_step(sqlStatement) == SQLITE_DONE {
                debugPrint("Scucess")
            } else {
                debugPrint("\(queryString): FAILED")
            }
            
        }
        sqlite3_finalize(sqlStatement)
    }
    
    static func insert() {
        var insertStatement: OpaquePointer?
        let queryString = SQLQuery.insertUserRecord.rawValue
        
        if sqlite3_prepare_v2(openDatabase(), queryString, -1, &insertStatement, nil) == SQLITE_OK {
            let userID: Int32 = 1
            let login: NSString = "Test"
            let password: NSString = "Test"
            let firstName: NSString = "Test"
            let lastName: NSString = "test"
            let accountID: Int32 = 1000
            let accountBalance: Int32 = 10
            let accountCurrentBalance: Int32 = 10
            
            sqlite3_bind_int(insertStatement, 1, userID)
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
        
        sqlite3_finalize(insertStatement)
        
    }
}
 
