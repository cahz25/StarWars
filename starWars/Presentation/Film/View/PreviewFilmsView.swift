//
//  PreviewFilmsView.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 1/09/22.
//

import SwiftUI

struct PreviewFilmsView: View {
    @StateObject var viewModel: PreviewFilmsViewModel
    
    var body: some View {
        VStack {
            Text("Films").font(.title2)
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(viewModel.films, id: \.uuid) {film in
                        NavigationLink(destination: FilmRouter.showDetail(film: film)) {
                            HorizontalCellView(name: film.title)
                        }
                    }
                }
            }
        }.task {
            viewModel.loadFilms()
        }
    }
}

struct PreviewFilmsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = PreviewFilmsViewModel(filmsUrl: [])
        PreviewFilmsView(viewModel: viewModel)
    }
}
