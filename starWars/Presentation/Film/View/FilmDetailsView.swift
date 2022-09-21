//
//  FilmDetailsView.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 30/08/22.
//

import SwiftUI

struct FilmDetailsView: View {
    @StateObject var viewModel: FilmDetailsViewModel
    var body: some View {
        VStack {
            ScrollView {
                ImageView(name: viewModel.film.title)
                    .scaledToFit()
                    .frame(width: 200, height: 200, alignment: .center)
                Text(viewModel.film.openingCrawl)
                HStack {
                    VStack {
                        Text("Created: \(viewModel.film.title)")
                        Text("Director: \(viewModel.film.director)")
                    }
                    VStack {
                        Text("Producer: \(viewModel.film.producer)")
                        Text("Release Date: \(viewModel.film.releaseDate)")
                    }
                }.padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                if viewModel.film.characters.count > 0 {
                    PreviewPeopleView(viewModel: PreviewPeopleViewModel(peopleUrl: viewModel.film.characters))
                }
            }.navigationTitle(viewModel.film.title)
        }
    }
}

struct FilmDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let newHope = Film(title: "New Hope", episodeId: 1, openingCrawl: "R", director: "Lukas", producer: "Lukas", releaseDate: "12/12/!2", characters: ["http"], planets: [], starships: [], vehicles: [], species: [], created: "12/12/12", edited: "12/12/12", url: "http")
        
        let viewModel = FilmDetailsViewModel(newHope)
        FilmDetailsView(viewModel: viewModel)
    }
}
