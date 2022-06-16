//
//  Broadcaster.swift
//  TwitchApi
//
//  Created by Alessandro Masullo on 12/06/22.
//

import Foundation

// MARK: - Broadcaster
struct Broadcaster: Codable {
    let data: [BroadcasterDatum]?
}

// MARK: - Broadcaster Datum
struct BroadcasterDatum: Codable {
    let broadcaster_id, broadcaster_name, broadcaster_login: String?
    let is_gift: Bool?
    let tier: String?
}
