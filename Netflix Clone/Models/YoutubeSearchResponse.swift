//
//  YoutubeSearchResponse.swift
//  Netflix Clone
//
//  Created by Bagas Pangestu on 07/09/25.
//

import Foundation

// MARK: - YouTube Models (buat videoId optional agar decoding aman)
struct YoutubeSearchResponse: Codable {
    let items: [YouTubeSearchItem]
}

struct YouTubeSearchItem: Codable {
    let id: YouTubeId
}

struct YouTubeId: Codable {
    let kind: String?
    let videoId: String?
}
