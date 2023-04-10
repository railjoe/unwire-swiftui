//
//  unwire_swiftuiApp.swift
//  unwire-swiftui
//
//  Created by Jovan Stojanov on 9.4.23..
//

import SwiftUI

@main
struct unwire_swiftuiApp: App {
    private let repository: SearchMusicRespository = SearchMusicRespositoryImpl()
    var body: some Scene {
        WindowGroup {
            SearchView(viewModel: SearchViewModel(searchMusic: SearchMusicImpl(repository: repository)))
        }
    }
}
