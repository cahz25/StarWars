//
//  PreviewPeopleView.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 14/09/22.
//

import SwiftUI

struct PreviewPeopleView: View {
    @StateObject var viewModel: PreviewPeopleViewModel
    
    var body: some View {
        VStack {
            Text("Films").font(.title2)
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(viewModel.people, id: \.uuid) {person in
                        NavigationLink(destination: PeopleRouter.showDetail(person: person)) {
                            HorizontalCellView(name: person.name)
                        }
                    }
                }
            }
        }.task {
            viewModel.loadPeople()
        }
    }
}

struct PreviewPeopleView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = PreviewPeopleViewModel(peopleUrl: [])
        PreviewPeopleView(viewModel: viewModel)
    }
}
