//
//  TokenValidator.swift
//  Macro-Challenge-Hurricane
//
//  Created by Alessandro Masullo on 30/05/22.
//


import Foundation
import RealHTTP

class TokenValidator {
    
    func validToken(tokenToValidate: String) async {
        
        do{
            
            let req = HTTPRequest {
                // Setup default params
                $0.url = URL(string: "https://id.twitch.tv/oauth2/validate")!
                $0.method = .get
                $0.timeout = 15
            }
            
            req.headers[.authorization] = "Bearer \(tokenToValidate)"
            
            let response = try await req.fetch(ValidToken.self)
            
            print(response as Any)
            
            DataManager.standard.setUser_id(user_id: response?.user_id ?? "NULL")
            DataManager.standard.setLogin(login: response?.login ?? "NULL")
            DataManager.standard.setClient_id(client_id: response?.client_id ?? "NULL")
        } catch {
            print(error.localizedDescription)
        }
    }
}
