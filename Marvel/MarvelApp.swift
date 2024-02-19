//
//  MarvelApp.swift
//  Marvel
//
//  Created by Emerson Sampaio on 12/02/24.
//

import SwiftUI

@main
struct MarvelApp: App {
    init() {
        Resolver.shared.injectModules()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
