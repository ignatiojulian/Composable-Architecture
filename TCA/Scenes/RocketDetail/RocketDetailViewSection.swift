//
//  RocketDetailViewSection.swift
//  RocketApp
//
//  Created by Ignatio Julian on 22/01/23.
//

import SwiftUI

struct RocketDetailViewSection: View {
    let title: String
    let content: String

    var body: some View {
        HStack {
            Text(title)
                .font(.callout.bold())
            Text(content)
                .font(.callout)
        }
        .padding(.horizontal, 10)
        .padding(.bottom, 1)
    }
}
