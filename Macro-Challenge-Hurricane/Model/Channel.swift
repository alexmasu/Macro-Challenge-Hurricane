//
//  Streamer.swift
//  TwitchApi
//
//  Created by Alessandro Masullo on 27/05/22.
//

import Foundation

// MARK: - Channel
struct Channel: Codable {
    let data: [Channel_Datum]?
    let pagination: Pagination?
}

// MARK: - Channel_Datum
struct Channel_Datum: Codable {
    let broadcaster_language, broadcaster_login, display_name, game_id: String?
    let game_name, id: String?
    let is_live: Bool?
    let tags_ids: [String]?
    let thumbnail_url: String?
    let title, started_at: String?
}

// MARK: - Pagination
struct Pagination: Codable {
    let cursor: String?
}
