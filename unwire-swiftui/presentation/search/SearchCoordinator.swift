//
//  SearchCoordinator.swift
//  unwire
//
//  Created by Jovan Stojanov on 10.4.23..
//

import SwiftUI

open class SearchFlowState: ObservableObject {
    @Published var presentedItem: SearchResult?
    @Published var path = NavigationPath()
}

struct SearchFlowCoordinator<Content: View>: View {
    @ObservedObject var state: SearchFlowState
    let content: () -> Content

    var body: some View {
        NavigationStack(path: $state.path) {
            ZStack {
                content()
            }
//            .navigationDestination(for: SearchRoute.self, destination: linkDestination)
        }
    }

//    @ViewBuilder private func linkDestination(link: SearchRoute) -> some View {
//        switch link {
//        case let .searchDetails(searchResult):
//            
//        }
//    }
}
