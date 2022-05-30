//
//  GetUserInfo.swift
//  TwitchApi
//
//  Created by Alessandro Masullo on 27/05/22.
//

import Foundation
import RealHTTP


class UserInfo {
    
    func getUserInfo(userId: String,token: String,client_id: String) async {
        do {
            
            let req = HTTPRequest {
                // Setup default params
                $0.url = URL(string: "https://api.twitch.tv/helix/users")!
                $0.method = .get
                $0.timeout = 15
            }
            
            req.headers[.authorization] = "Bearer \(token)"
            
            req.headers[.custom("client-id")] = "\(client_id)"
            
            req.addQueryParameter(name: "id", value: "\(userId)")
            
            let response = try await req.fetch(User.self)
            
            //            if let data = response.data {
            //                let json = String(data: data, encoding: .utf8)
            //                print("Failure Response: \(json)")
            //            }
            
            DataManager.standard.setProfile_image_url(profile_image_url: response?.data.first?.profile_image_url ?? "NULL")
            
            print(response?.data.first?.profile_image_url as Any)
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
