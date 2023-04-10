//
//  SearchView.swift
//  unwire-swiftui
//
//  Created by Jovan Stojanov on 10.4.23..
//

import SwiftUI

struct SearchView: View {
    @StateObject
    var viewModel: SearchViewModel
    
    var body: some View {
        SearchFlowCoordinator(state: viewModel, content: content)
    }
    
    @ViewBuilder private func content() -> some View {
        ZStack {
            switch viewModel.state {
            case .initial:
                Rectangle()
                    .foregroundColor(.clear)
            case .loading:
                VStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle()).padding(.top, 10)
                    Spacer()
                }
            case .success(let searchResults):
                if searchResults.isEmpty {
                    VStack{
                        Text("search_music.no_results_title")
                            .font(.title)
                        Text("search_music.no_results_message")
                            .font(.subheadline)
                    }
                } else {
                    ScrollView {
                        LazyVStack(alignment: .leading) {
                            ForEach(searchResults, id: \.id) { searchResult in
                                NavigationLink(value: SearchRoute.searchDetails(searchResult: searchResult)) {
                                    SearchResultRow(searchResult: searchResult)
                                }
                            }
                        }
                    }
                }
            case .failure(_):
                VStack{
                    Text("search_music.error_title")
                        .font(.title)
                    Text("search_music.error_message")
                        .font(.subheadline)
                }
            }
        }
        .searchable(text: $viewModel.searchText, placement: .sidebar, prompt: "search_music.placeholder")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text("search_music.title")
                }
            }
        }
    }
}
