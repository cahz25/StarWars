//
//  GetFilmUseCase.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 23/08/22.
//

import Foundation
import Combine

class GetFilmUseCase: UseCase {
    
    typealias P = String
    typealias R = AnyPublisher<Film, Error>
    
    private var repository: FilmRepository
    
    init(repository: FilmRepository) {
        self.repository = repository
    }
    
    func execute(params url: String) -> AnyPublisher<Film, Error> {
        return self.repository.getFilm(url: url)
    }
}
