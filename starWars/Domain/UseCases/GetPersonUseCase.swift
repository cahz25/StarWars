//
//  GetPersonUseCase.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 14/09/22.
//

import Foundation
import Combine

class GetPersonUseCase: UseCase {
    
    typealias P = String
    typealias R = AnyPublisher<Person, Error>
    
    private var repository: PeopleRepository
    
    init(repository: PeopleRepository) {
        self.repository = repository
    }
    
    func execute(params url: String) -> AnyPublisher<Person, Error> {
        return self.repository.getPerson(url: url)
    }
}
