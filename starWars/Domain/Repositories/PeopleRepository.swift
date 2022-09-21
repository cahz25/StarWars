//
//  PeopleRepository.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 27/07/22.
//

import Foundation
import Combine

protocol PeopleRepository {
    // func getPeople(completion: @escaping (People) -> Void, failure: @escaping (Error) -> Void)
    func getPeople(url: String?) -> AnyPublisher<People, Error>
    func getPerson(url: String)  -> AnyPublisher<Person, Error>
    func searchPerson(url: String?, query: String?)  -> AnyPublisher<People, Error>
}
