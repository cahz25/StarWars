//
//  FilmDetailsViewModel.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 30/08/22.
//

import Foundation

class FilmDetailsViewModel: ObservableObject {
    @Published var film: Film
    
    init(_ film: Film) {
        self.film = film
    }
}
