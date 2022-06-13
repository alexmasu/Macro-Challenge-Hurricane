//
//  TwitchService.swift
//  TwitchApi
//
//  Created by Alessandro Masullo on 01/06/22.
//

import Foundation
import RealHTTP


class TwitchService {
    
    /*
     https://dev.twitch.tv/docs/authentication/validate-tokens#how-to-validate-a-token
     */
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
    
    
    
    /*
     https://dev.twitch.tv/docs/api/reference#get-users
     
     Gets information about one or more specified Twitch users. Users are identified by optional user IDs and/or login name. If neither a user ID nor a login name is specified, the user is looked up by Bearer token.
     The response has a JSON payload with a data field containing an array of user-information elements.
     
     */
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
    
    /*
     https://dev.twitch.tv/docs/api/reference#search-channels
     
     Returns a list of channels (users who have streamed within the past 6 months) that match the query via channel name or description either entirely or partially. Results include both live and offline channels. Online channels will have additional metadata (e.g. started_at, tag_ids).
     
     */
    func searchChannel(token: String,client_id: String,query: String,live_only: Bool) async {
        
        do {
            
            let req = HTTPRequest {
                // Setup default params
                $0.url = URL(string: "https://api.twitch.tv/helix/search/channels")!
                $0.method = .get
                $0.timeout = 15
            }
            
            req.headers[.authorization] = "Bearer \(token)"
            
            req.headers[.custom("client-id")] = "\(client_id)"
            
            
            req.addQueryParameter(name: "query", value: query)
            
            req.addQueryParameter(name: "live_only", value: live_only.description)
            
            req.addQueryParameter(name: "first", value: "20")
            
            
            //            let response = try await req.fetch(Channel.self)
            
            //            if let data = response.data {
            //                let json = String(data: data, encoding: .utf8)
            //                print("Failure Response: \(json)")
            //            }
            
            //            print(response as Any)
            
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    
    
    /*
     https://dev.twitch.tv/docs/api/reference#check-user-subscription
     
     Checks if a specific user (user_id) is subscribed to a specific channel (broadcaster_id).
     
     */
    func checkUserSubscription(token: String,client_id: String,user_id: String) async {
        do {
            
            let req = HTTPRequest {
                // Setup default params
                $0.url = URL(string: "https://api.twitch.tv/helix/subscriptions/user")!
                $0.method = .get
                $0.timeout = 15
            }
            
            req.headers[.authorization] = "Bearer \(token)"
            
            req.headers[.custom("client-id")] = "\(client_id)"
            
            req.addQueryParameter(name: "broadcaster_id", value: "29750090")
            
            req.addQueryParameter(name: "user_id", value: user_id)
            
            let response = try await req.fetch(Broadcaster.self)
            
        } catch  {
            print("\(user_id) has no subscriptions to 136011430")
            print(error.localizedDescription)
        }
    }
    
    
}
