//
//  GetVehicleUseCase.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 24/08/22.
//

import Foundation
import Combine

class GetVehicleUseCase: UseCase {
    
    typealias P = String
    typealias R = AnyPublisher<Vehicle, Error>
    
    private var repository: VehicleRepository
    
    init(repository: VehicleRepository) {
        self.repository = repository
    }
    
    func execute(params url: String) -> AnyPublisher<Vehicle, Error> {
        return self.repository.getVehicle(url: url)
    }
}
