//
//  PeopleDetailsViewModel.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 3/08/22.
//

import Foundation
import Combine

class PeopleDetailsViewModel: ObservableObject {
    @Published var starships = [Starship]()
    var starshipError: Error?
    var person: Person
    
    private let getStarshipUsecase = GetStarshipUseCase(repository: StarshipRepositoryImp())
    private var bag = Set<AnyCancellable>()
    
    init(_ person: Person) {
        self.person = person
    }
    
    func getDetails() {
        getStarship()
    }
    
    private func getStarship() {
        // filmError = nil
        Publishers.MergeMany(person.starships.map( self.getStarshipUsecase.execute(params: ))).collect().receive(on: RunLoop.main).sink(receiveCompletion: { [weak self] error in
            if case .failure(let error) = error {
                print("Error \(error)")
                // self?.filmError = error
            }
        }, receiveValue: { [weak self] starships in
            if self != nil {
                self!.starships = starships
            }
        }).store(in: &bag)
    }
}
