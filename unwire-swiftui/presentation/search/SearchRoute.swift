//
//  SearchRoute.swift
//  unwire-swiftui
//
//  Created by Jovan Stojanov on 10.4.23..
//

import Foundation

enum SearchRoute: Hashable {
    
    case searchDetails(searchResult: SearchResult)
    
    var id: Self {
        return self
    }
}
