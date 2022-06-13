//
//  Broadcaster.swift
//  TwitchApi
//
//  Created by Alessandro Masullo on 12/06/22.
//

import Foundation

// MARK: - Broadcaster
struct Broadcaster: Codable {
    let data: [BroadcasterDatum]
}

// MARK: - Broadcaster Datum
struct BroadcasterDatum: Codable {
    let broadcasterID, broadcasterName, broadcasterLogin: String
    let isGift: Bool
    let tier: String
}
