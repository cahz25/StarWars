//
//  GetPeopleUseCase.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 27/07/22.
//

import Foundation
import Combine

class GetPeopleUseCase: UseCase {
    
//    typealias P = (completion: (People) -> Void, failure: (Error) -> Void)
//    typealias R = Void
    
    typealias P = String?
    typealias R = AnyPublisher<People, Error>
    
    private var repository: PeopleRepository
    
    init(repository: PeopleRepository) {
        self.repository = repository
    }
    
    func execute(params url: String?) -> AnyPublisher<People, Error> {
        return self.repository.getPeople(url: url)
    }
    
//    func execute(params: (completion: (People) -> Void, failure: (Error) -> Void)) -> Void {
//        self.repository.getPeople { people in
//            print("People is \(people.results.description)")
//            params.completion(people)
//        } failure: { error in
//            print("Error in getPeople \(error.localizedDescription)")
//            params.failure(error)
//        }
//    }
    
}
