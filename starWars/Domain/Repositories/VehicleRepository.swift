//
//  VehicleRepository.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 24/08/22.
//

import Foundation
import Combine

protocol VehicleRepository {
    func getVehicle(url: String) -> AnyPublisher<Vehicle, Error>
}
