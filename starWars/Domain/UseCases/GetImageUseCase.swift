//
//  GetImageUseCase.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 30/08/22.
//

import Foundation

class GetImageUseCase: UseCase {
    
    typealias P = String
    typealias R = String
    
    private var repository: ImageRepository
    
    init(repository: ImageRepository) {
        self.repository = repository
    }
    
    func execute(params name: String) -> String {
        return self.repository.getUrlImage(name: name)
    }
}
