//
//  VehicleRepositoryImpl.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 24/08/22.
//

import Foundation
import Combine

class VehicleRepositoryImp: VehicleRepository {
    
    func getVehicle(url: String) -> AnyPublisher<Vehicle, Error> {
        if let url = URL(string: url) {
            return URLSession.shared.dataTaskPublisher(for: url).map(\.data).decode(type: Vehicle.self, decoder: JSONDecoder()).eraseToAnyPublisher()
        } else {
            return Fail(error: NSError(domain: "Missing film URL", code: -10001, userInfo: nil)).eraseToAnyPublisher()
        }
    }
    
}
