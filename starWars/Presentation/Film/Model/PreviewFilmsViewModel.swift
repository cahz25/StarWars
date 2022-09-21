//
//  PreviewFilmsViewModel.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 1/09/22.
//

import Foundation
import Combine

class PreviewFilmsViewModel: ObservableObject {
    @Published var films = [Film]()
    
    private var filmsUrl = [String]()
    private var filmError: Error?
    private let getFilmUsecase = GetFilmUseCase(repository: FilmRepositoryImp())
    private var bag = Set<AnyCancellable>()
    
    init(filmsUrl: [String]) {
        self.filmsUrl = filmsUrl
    }
    
    func loadFilms() {
        filmError = nil
        Publishers.MergeMany(filmsUrl.map( self.getFilmUsecase.execute(params: ))).collect().receive(on: RunLoop.main).sink(receiveCompletion: { [weak self] error in
            if case .failure(let error) = error {
                print("Error \(error)")
                self?.filmError = error
            }
        }, receiveValue: { [weak self] films in
            if self != nil {
                self!.films = films
            }
        }).store(in: &bag)
    }
}
