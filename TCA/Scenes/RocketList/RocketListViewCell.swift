//
//  RocketListViewCell.swift
//  RocketApp
//
//  Created by Ignatio Julian on 22/01/23.
//

import SwiftUI

struct RocketListViewCell: View {
    let rocket: Rocket

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: rocket.flickrImages[0])) { image in
                image
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(20)
            } placeholder: {
                Image(systemName: "photo.circle")
                    .frame(width: 40, height: 40)
                    .scaleEffect(2)
            }
            VStack(alignment: .leading) {
                Text(rocket.name)
                    .font(.headline)
                    .padding(.bottom, 1)
                Text(rocket.description)
                    .font(.subheadline)
                    .lineLimit(1)
            }
        }
    }
}
