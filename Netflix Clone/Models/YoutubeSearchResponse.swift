//
//  YoutubeSearchResponse.swift
//  Netflix Clone
//
//  Created by Mehmet Ali Er on 13.01.2024.
//

import Foundation



struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}


struct VideoElement: Codable {
    let id: IdVideoElement
}


struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
