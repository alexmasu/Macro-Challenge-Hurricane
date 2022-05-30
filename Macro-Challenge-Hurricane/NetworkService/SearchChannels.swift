//
//  SearchChannels.swift
//  TwitchApi
//
//  Created by Alessandro Masullo on 27/05/22.
//

import Foundation
import RealHTTP


class ChannelFinder{
    
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
            
            
            let response = try await req.fetch(Channel.self)
            
            //            if let data = response.data {
            //                let json = String(data: data, encoding: .utf8)
            //                print("Failure Response: \(json)")
            //            }
            
            //            print(response as Any)
            
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
}
