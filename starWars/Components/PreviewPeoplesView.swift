//
//  PreviewPeoplesView.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 1/09/22.
//

import SwiftUI

struct PreviewPeoplesView: View {
    var people: [Person]
    
    var body: some View {
        Text("Character").font(.title2)
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(people, id: \.uuid) {person in
                    HorizontalCellView(name: person.name)
                }
            }
        }
    }
}

struct PreviewPeoplesView_Previews: PreviewProvider {
    static var previews: some View {
        let people = [Person]()
        PreviewPeoplesView(people: people)
    }
}
