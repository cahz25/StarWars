//
//  PreviewPeopleViewModel.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 14/09/22.
//

import Foundation
import Combine

class PreviewPeopleViewModel: ObservableObject {
    @Published var people = [Person]()
    
    private var peopleUrl = [String]()
    private var peopleError: Error?
    private let getPersonUsecase = GetPersonUseCase(repository: PeopleRepositoryImp())
    private var bag = Set<AnyCancellable>()
    
    init(peopleUrl: [String]) {
        self.peopleUrl = peopleUrl
    }
    
    func loadPeople() {
        peopleError = nil
        Publishers.MergeMany(peopleUrl.map( self.getPersonUsecase.execute(params: ))).collect().receive(on: RunLoop.main).sink(receiveCompletion: { [weak self] error in
            if case .failure(let error) = error {
                print("Error \(error)")
                self?.peopleError = error
            }
        }, receiveValue: { [weak self] people in
            if self != nil {
                self!.people = people
            }
        }).store(in: &bag)
    }
}
