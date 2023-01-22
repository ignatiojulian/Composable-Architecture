//
//  RocketListViewReducer.swift
//  RocketApp
//
//  Created by Ignatio Julian on 22/01/23.
//

import ComposableArchitecture

internal struct RocketListViewReducer: ReducerProtocol {
    internal struct State: Equatable {
        internal var pageState: PageState
        internal var rockets: [Rocket]
        internal var searchInput: String

        internal var filteredRockets: [Rocket] {
            if searchInput.isEmpty {
                return rockets
            }
            return rockets.filter { rocket in
                rocket.name.lowercased().contains(searchInput.lowercased())
            }
        }

        internal init(
            pageState: PageState = .loading,
            rockets: [Rocket] = [],
            searchInput: String = ""
        ) {
            self.pageState = pageState
            self.rockets = rockets
            self.searchInput = searchInput
        }
    }

    internal enum Action: Equatable {
        case didLoad
        case receiveData(response: Result<[Rocket], NetworkError>)
        case searchRocketName(input: String)
        case reloadData
    }

    internal func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .didLoad:
            return .task {
                await .receiveData(response: NetworkService().request(to: RocketEndpoint.getAllRocket, decodeTo: [Rocket].self))
            }

        case let .receiveData(response):
            switch response {
            case let .success(rockets):
                state.rockets = rockets
                state.pageState = .success
            case .failure:
                state.pageState = .failure
            }
            return .none

        case let .searchRocketName(input):
            state.searchInput = input
            return .none

        case .reloadData:
            state.pageState = .loading
            return .task {
                await .receiveData(response: NetworkService().request(to: RocketEndpoint.getAllRocket, decodeTo: [Rocket].self))
            }
        }
    }
}
