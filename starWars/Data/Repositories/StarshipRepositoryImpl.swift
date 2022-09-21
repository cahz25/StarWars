//
//  StarshipRepositoryImpl.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 24/08/22.
//

import Foundation
import Combine

class StarshipRepositoryImp: StarshipRepository {
    
    func getStarship(url: String) -> AnyPublisher<Starship, Error> {
        if let url = URL(string: url) {
            return URLSession.shared.dataTaskPublisher(for: url).map(\.data).decode(type: Starship.self, decoder: JSONDecoder()).eraseToAnyPublisher()
        } else {
            return Fail(error: NSError(domain: "Missing film URL", code: -10001, userInfo: nil)).eraseToAnyPublisher()
        }
    }
    
}
