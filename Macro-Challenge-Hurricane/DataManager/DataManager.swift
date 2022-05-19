//
//  DataManager.swift
//
//  Created by Emad Bayramy on 8/23/20.
//  Copyright © 2021  Emad Bayramy All rights reserved.
//

import Foundation

class DataManager: NSObject {
    
    // MARK: - Singleton
    static var standard = DataManager()
    
    // MARK: - Saved Data
    @Storage(key: "token", defaultValue: "NULL")
    var token: String
    
    // MARK: - Setter
    func setToken(token: String) {
        self.token = token
    }
    
    // MARK: - Getter
    func getToken() -> String {
        return self.token
    }
    
}
