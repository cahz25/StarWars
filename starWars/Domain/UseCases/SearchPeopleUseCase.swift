//
//  SearchPeopleUseCase.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 14/09/22.
//

import Foundation
import Combine

class SearchPeopleUseCase: UseCase {
    typealias P = (url: String?, query: String?)
    typealias R = AnyPublisher<People, Error>
    
    private var repository: PeopleRepository
    
    init(repository: PeopleRepository) {
        self.repository = repository
    }
    
    func execute(params: (url: String?, query: String?)) -> AnyPublisher<People, Error> {
        return self.repository.searchPerson(url: params.url, query: params.query)
    }
}
