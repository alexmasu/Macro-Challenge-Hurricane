//
//  User.swift
//  TwitchApi
//
//  Created by Alessandro Masullo on 27/05/22.
//
import Foundation

// MARK: - User Model
struct User: Codable {
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let id, login, display_name, type: String
    let broadcaster_type, description: String
    let profile_image_url: String
    let offline_image_url: String
    let view_count: Int
    let created_at: String
}
