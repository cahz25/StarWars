//
//  PeopleListViewModel.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 21/07/22.
//

import Foundation
import Combine

class PeopleListViewModel: ObservableObject {
    @Published var people: Array<Person> = []
    @Published var isLoading = false
    
    private let getPeopleUsecase = GetPeopleUseCase(repository: PeopleRepositoryImp())
    private let searchPeopleUsecase = SearchPeopleUseCase(repository: PeopleRepositoryImp())
    private var bag = Set<AnyCancellable>()
    private var nextSearchUrl: String? = nil
    private var nextUrl: String? = nil
    private var currentSearchQuery: String? = nil
    
    init() {
        self.getNextPeople()
    }
    
    func getNextPeople() {
        if currentSearchQuery == nil {
            self.isLoading = true
            self.getPeopleUsecase.execute(params: nextUrl).receive(on: RunLoop.main).sink(receiveCompletion: { [weak self] error in
                if case .failure(let error) = error {
                    print("Error \(error)")
                }
                self?.isLoading = false
            }, receiveValue: { [weak self] people in
                if self != nil {
                    self!.nextUrl = people.next
                    self!.people = self!.people + people.results
                }
            }).store(in: &bag)
        }
    }
    
    func loadMoreContentIfNeeded(currentItem person: Person?) {
        guard let person = person else {
            getNextPeople()
            return
        }

        let thresholdIndex = self.people.index(self.people.endIndex, offsetBy: -5)
        if self.people.firstIndex(where: { $0.name == person.name }) == thresholdIndex {
            if currentSearchQuery == nil {
                getNextPeople()
            } else {
                search(text: currentSearchQuery!)
            }
            
        }
    }
    
    func search(text: String?) {
        print("search")
        if currentSearchQuery != text {
            cleanSearch()
            currentSearchQuery = text
        }
        self.isLoading = true
        self.searchPeopleUsecase.execute(params: (url: nextSearchUrl, query: currentSearchQuery)).receive(on: RunLoop.main).sink { [weak self] error in
            if case .failure(let error) = error {
                print("Error \(error)")
            }
            self?.isLoading = false
        } receiveValue: { [weak self] people in
            if self != nil {
                self!.nextSearchUrl = people.next
                self!.people = self!.people + people.results
            }
        }.store(in: &bag)

    }
    
    func cancelSearch() {
        print("cancel Search")
        // cleanSearch()
        nextSearchUrl = nil
        currentSearchQuery = nil
        people = []
        getNextPeople()
    }
    
    private func cleanSearch() {
        nextSearchUrl = nil
        nextUrl = nil
        currentSearchQuery = nil
        people = []
    }
}
