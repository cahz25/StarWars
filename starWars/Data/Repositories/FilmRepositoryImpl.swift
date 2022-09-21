//
//  FilmRepositoryImpl.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 23/08/22.
//

import Foundation
import Combine

class FilmRepositoryImp: FilmRepository {
    
    func getFilm(url: String) -> AnyPublisher<Film, Error> {
        if let url = URL(string: url) {
            return URLSession.shared.dataTaskPublisher(for: url).map(\.data).decode(type: Film.self, decoder: JSONDecoder()).eraseToAnyPublisher()
        } else {
            return Fail(error: NSError(domain: "Missing film URL", code: -10001, userInfo: nil)).eraseToAnyPublisher()
        }
    }
    
}
