//
//  FilmRepository.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 23/08/22.
//

import Foundation
import Combine

protocol FilmRepository {
    func getFilm(url: String) -> AnyPublisher<Film, Error>
}
