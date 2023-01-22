//
//  RocketListView.swift
//  RocketApp
//
//  Created by Ignatio Julian on 22/01/23.
//

import ComposableArchitecture
import SwiftUI

struct RocketListView: View {
    let store: StoreOf<RocketListViewReducer>

    var body: some View {
        NavigationView {
            WithViewStore(self.store, observe: { $0 }) { viewStore in
                ZStack {
                    switch viewStore.pageState {
                    case .loading:
                        ProgressView()
                            .progressViewStyle(.circular)
                            .tint(.gray)
                            .scaleEffect(2)

                    case .success:
                        VStack {
                            TextField(
                                "Search rocket name",
                                text: viewStore.binding(
                                    get: { state in
                                        state.searchInput
                                    },
                                    send: { input in
                                        .searchRocketName(input: input)
                                    }
                                )
                            )
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 20)
                            List {
                                ForEach(viewStore.filteredRockets) { rocket in
                                    NavigationLink {
                                        RocketDetailView(rocket: rocket)
                                    } label: {
                                        RocketListViewCell(rocket: rocket)
                                    }
                                }
                            }
                        }

                    case .failure:
                        Button {
                            viewStore.send(.reloadData)
                        } label: {
                            Text("Retry")
                                .font(.title)
                                .frame(width: 120, height: 60)
                                .foregroundColor(.white)
                                .background(.gray)
                                .cornerRadius(20)
                        }
                    }
                }
                .onAppear {
                    viewStore.send(.didLoad)
                }
            }
            .navigationTitle("Rocket List")
        }
    }
}
