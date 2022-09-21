//
//  PeopleRepositoryImpl.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 28/07/22.
//

import Foundation
import Combine

class PeopleRepositoryImp: PeopleRepository {
    
    private let PEOPLE_SOURCE = "https://swapi.dev/api/people/"
    private let SEARCH_PEOPLE_SOURCE = "https://swapi.dev/api/people/?search="
    private var currentUrl: String?
    
    //func getPeople(completion: @escaping (People) -> Void, failure: @escaping (Error) -> Void) {
    //    if nextUrl != nil {
    //        guard let url = URL(string: nextUrl!) else {
    //            return
    //        }
    //        URLSession.shared.dataTask(with: url) { data, response, error in
    //
    //            guard let data = data, !data.isEmpty else {
    //                failure(PeopleExceptions.list)
    //                return
    //            }
    //
    //            guard let result = try? JSONDecoder().decode(People.self, from: data) else {
    //                failure(PeopleExceptions.list)
    //                return
    //            }
    //
    //            DispatchQueue.main.async {
    //                self.nextUrl = result.next
    //                completion(result)
    //            }
    //
    //        }.resume()
    //    }
    //}
    
    func getPeople(url: String?) -> AnyPublisher<People, Error>  {
        var nextUrl = url
        if nextUrl == nil {
            nextUrl = PEOPLE_SOURCE
        }
        if currentUrl != nextUrl, let url = URL(string: nextUrl!) {
            currentUrl = nextUrl
            return URLSession.shared.dataTaskPublisher(for: url).map(\.data).decode(type: People.self, decoder: JSONDecoder()).eraseToAnyPublisher()
        } else {
            return Fail(error: NSError(domain: "Missing Feed URL", code: -10001, userInfo: nil)).eraseToAnyPublisher()
        }
        
    }
    
    func getPerson(url: String) -> AnyPublisher<Person, Error>  {
        if let url = URL(string: url) {
            return URLSession.shared.dataTaskPublisher(for: url).map(\.data).decode(type: Person.self, decoder: JSONDecoder()).eraseToAnyPublisher()
        } else {
            return Fail(error: NSError(domain: "Missing person URL", code: -10001, userInfo: nil)).eraseToAnyPublisher()
        }
    }
    
    func searchPerson(url: String?, query: String?) -> AnyPublisher<People, Error> {
        var searchUrl = ""
        if url == nil, query != nil {
            searchUrl = (SEARCH_PEOPLE_SOURCE)+(query!)
        } else if url != nil {
            searchUrl = url!
        }
        if searchUrl != "", let newUrl = URL(string: searchUrl) {
            return URLSession.shared.dataTaskPublisher(for: newUrl).map(\.data).decode(type: People.self, decoder: JSONDecoder()).eraseToAnyPublisher()
        } else {
            return Fail(error: NSError(domain: "Missing person URL", code: -10001, userInfo: nil)).eraseToAnyPublisher()
        }
    }
    
}
