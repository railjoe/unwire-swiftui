//
//  SearchResult.swift
//  unwire
//
//  Created by Jovan Stojanov on 10.4.23..
//

import Foundation

struct SearchResult: Identifiable, Hashable {
    let id: Int?
    let trackName: String?
    let artistName: String?
    let shortDescription: String?
    let artworkURL: URL?
    let releaseDate: Date?
    
    init(id: Int?, trackName: String?, artistName: String?, shortDescription: String?, artworkURL: URL?, releaseDate: Date?) {
        self.id = id
        self.trackName = trackName
        self.artistName = artistName
        self.shortDescription = shortDescription
        self.artworkURL = artworkURL
        self.releaseDate = releaseDate
    }
    
    static func == (lhs: SearchResult, rhs: SearchResult) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
