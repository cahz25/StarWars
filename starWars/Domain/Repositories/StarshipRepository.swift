//
//  StarshipRepository.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 24/08/22.
//

import Foundation
import Combine

protocol StarshipRepository {
    func getStarship(url: String) -> AnyPublisher<Starship, Error>
}
