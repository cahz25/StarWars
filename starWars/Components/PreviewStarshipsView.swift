//
//  PreviewStarshipsView.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 1/09/22.
//

import SwiftUI

struct PreviewStarshipsView: View {
    var starships: [Starship]
    var body: some View {
        Text("Starships").font(.title2)
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(starships, id: \.uuid) {starship in
                    HorizontalCellView(name: starship.name)
                }
            }
        }
    }
}

struct PreviewStarshipsView_Previews: PreviewProvider {
    static var previews: some View {
        let starships = [Starship]()
        PreviewStarshipsView(starships: starships)
    }
}
