//
//  RocketApp.swift
//  TCA
//
//  Created by Ignatio Julian on 23/12/22.
//

import SwiftUI
import ComposableArchitecture

@main
struct RocketApp: App {
    var body: some Scene {
        WindowGroup {
            RocketListView(store: Store(initialState: RocketListViewReducer.State(),
                                        reducer: RocketListViewReducer()))
        }
    }
}
