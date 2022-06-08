//
//  Token.swift
//  TwitchApi
//
//  Created by Alessandro Masullo on 26/05/22.

import Foundation

// MARK: - Valid Token
struct ValidToken: Codable {
    let client_id: String?
    let login: String
    let scopes: [String]?
    let user_id: String
    let expires_in: Int?
}


// MARK: - Bad Token
struct NotValidToken: Codable {
    let status: Int
    let message: String
}
