//
//  GetStarshipUseCase.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 24/08/22.
//

import Foundation
import Combine

class GetStarshipUseCase: UseCase {
    
    typealias P = String
    typealias R = AnyPublisher<Starship, Error>
    
    private var repository: StarshipRepository
    
    init(repository: StarshipRepository) {
        self.repository = repository
    }
    
    func execute(params url: String) -> AnyPublisher<Starship, Error> {
        return self.repository.getStarship(url: url)
    }
}
