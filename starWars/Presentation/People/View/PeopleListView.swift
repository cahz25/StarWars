//
//  PeopleListView.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 21/07/22.
//

import SwiftUI

struct PeopleListView: View {
    @StateObject var model = PeopleListViewModel()
    @State var searchQuery = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(model.people, id: \.uuid) { person in
                    NavigationLink(destination: PeopleRouter.showDetail(person: person)) {
                        CellView(title: person.name, subtitle: person.birthYear)
                           .onAppear {
                               model.loadMoreContentIfNeeded(currentItem: person)
                           }
                       }
                    }
                if model.isLoading {
                     ProgressView()
                       .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
                   }
            }.onAppear {
                model.loadMoreContentIfNeeded(currentItem: nil)
            }.navigationTitle("People")
        }.searchable(text: $searchQuery, placement: .navigationBarDrawer(displayMode: .always)).onSubmit(of: .search) {
            model.search(text: searchQuery)
        }.onChange(of: searchQuery) { newValue in
            if newValue == "" {
                model.cancelSearch()
            }
        }
    }
}

struct PeopleListView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleListView()
    }
}
