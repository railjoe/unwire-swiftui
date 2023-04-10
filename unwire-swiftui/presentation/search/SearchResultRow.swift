//
//  SearchResultRow.swift
//  unwire-swiftui
//
//  Created by Jovan Stojanov on 10.4.23..
//

import SwiftUI
import Foundation

struct SearchResultRow: View {
    
    var searchResult: SearchResult
    
    private let cornerRadius = 4.0
    private let imageSize = 50.0
    private let imageAspectRatio = 1.0
    private let captionOpacity = 0.5
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 10){
                AsyncImage(url: searchResult.artworkURL) { image in
                    image.resizable()
                } placeholder: {
                    Color.primary
                }
                .aspectRatio(imageAspectRatio, contentMode: .fit)
                .frame(maxWidth: imageSize, maxHeight: imageSize)
                .mask(Rectangle()
                    .cornerRadius(cornerRadius))
                VStack(alignment: .leading) {
                    Text(searchResult.trackName ?? "")
                        .multilineTextAlignment(.leading)
                        .font(.body)
                        .foregroundColor(.primary)
                    Text(searchResult.artistName ?? "")
                        .multilineTextAlignment(.leading)
                        .font(.body)
                        .foregroundColor(.primary)
                    Text(formattedDate(date:searchResult.releaseDate))
                        .multilineTextAlignment(.leading)
                        .font(.caption)
                        .foregroundColor(.primary.opacity(captionOpacity))
                    Text(searchResult.shortDescription ?? "")
                        .multilineTextAlignment(.leading)
                        .font(.caption)
                        .foregroundColor(.primary.opacity(captionOpacity))
                }
            }.padding(.horizontal, 10).padding(.vertical, 5)
            Divider().padding(.leading, 20)
        }
    }
    
    func formattedDate(date: Date?) -> String {
        if let date = date {
            let dateFormat = DateFormatter()
            dateFormat.dateStyle = .short
            dateFormat.timeZone = .none
            return dateFormat.string(from: date)
        } else {
            return ""
        }
    }
}

