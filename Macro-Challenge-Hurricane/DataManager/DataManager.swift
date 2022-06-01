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
    
    // MARK: - Saved Client id
    @Storage(key: "client_id", defaultValue: "NULL")
    var client_id: String
    
    // MARK: - Setter Client id
    func setClient_id(client_id: String) {
        self.client_id = client_id
    }
    
    // MARK: - Getter Client id
    func getClient_id() -> String {
        return self.client_id
    }
    
    
    // MARK: - Saved Token
    @Storage(key: "token", defaultValue: "NULL")
    var token: String
    
    // MARK: - Setter Token
    func setToken(token: String) {
        self.token = token
    }
    
    // MARK: - Getter Token
    func getToken() -> String {
        return self.token
    }
    
    
    
    
    // MARK: - Saved user_id
    @Storage(key: "user_id", defaultValue: "NULL")
    var user_id: String
    
    // MARK: - Setter user_id
    func setUser_id(user_id: String) {
        self.user_id = user_id
    }
    
    // MARK: - Getter user_id
    func getUser_id() -> String {
        return self.user_id
    }
    
    
    
    
    // MARK: - Saved login
    @Storage(key: "login", defaultValue: "NULL")
    var login: String
    
    // MARK: - Setter login
    func setLogin(login: String) {
        self.login = login
    }
    
    // MARK: - Getter login
    func getLogin() -> String {
        return self.login
    }
    
    
    
    // MARK: - Saved profile image url
    @Storage(key: "profile_image_url", defaultValue: "NULL")
    var profile_image_url: String
    
    // MARK: - Setter profile image url
    func setProfile_image_url(profile_image_url: String) {
        self.profile_image_url = profile_image_url
    }
    
    // MARK: - Getter profile image url
    func getProfile_image_url() -> String {
        return self.profile_image_url
    }
    
    // MARK: - Saved mochi
    @Storage(key: "mochi", defaultValue: "NULL")
    var mochi: String
    
    // MARK: - Setter mochi
    func setMochi(mochi: MochiJson) {
        
        do {
            let encoder = JSONEncoder()
            let encoded = try? encoder.encode(mochi)
            
            print(encoded!.jsonString() as Any)
            
            self.mochi = encoded!.jsonString()!
            
        } catch {
            print("Error Encoding Mochi")
            print(error)
            self.mochi = "NULL"
        }
        
    }
    
    // MARK: - Getter mochi
    func getMochi() -> MochiJson {
        
        do {
            
            let decoder = JSONDecoder()
            
            let jsonData: Data = self.mochi.data(using: .utf8)!
            
            let mochiDecoded = try? decoder.decode(MochiJson.self, from: jsonData)
            
            return mochiDecoded!
            
        } catch {
            print("Error Decoding Mochi")
            print(error)
        }
    }
    
}
