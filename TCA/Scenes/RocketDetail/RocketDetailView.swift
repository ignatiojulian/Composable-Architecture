//
//  RocketDetailView.swift
//  RocketApp
//
//  Created by Ignatio Julian on 22/01/23.
//

import SwiftUI

struct RocketDetailView: View {
    let rocket: Rocket

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: rocket.flickrImages[0])) { image in
                    image
                        .resizable()
                        .frame(height: 250)
                } placeholder: {
                    HStack {
                        Spacer()
                        Image(systemName: "photo")
                            .frame(width: 250, height: 250)
                            .scaleEffect(4)
                        Spacer()
                    }
                }
                .padding(10)
                Text(rocket.name)
                    .font(.title.bold())
                    .padding(.horizontal, 10)
                    .padding(.bottom, 2)
                Text(rocket.description)
                    .font(.callout)
                    .padding(.horizontal, 10)
                    .padding(.bottom, 1)
                RocketDetailViewSection(
                    title: "Cost per Launch:",
                    content: "$\(rocket.costPerLaunch.formatted())"
                )
                RocketDetailViewSection(
                    title: "Country:",
                    content: rocket.country
                )
                RocketDetailViewSection(
                    title: "First Flight:",
                    content: rocket.firstFlight
                )
                Spacer()
            }
        }
        .navigationTitle("Rocket Detail")
    }
}
