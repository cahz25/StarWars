//
//  PreviewVehiclesViewModel.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 1/09/22.
//

import Foundation
import Combine

class PreviewVehiclesViewModel: ObservableObject {
    @Published var vehicles = [Vehicle]()
    
    private var vehiclesUrl = [String]()
    private var vehicleError: Error?
    private let getVehicleUsecase = GetVehicleUseCase(repository: VehicleRepositoryImp())
    private var bag = Set<AnyCancellable>()
    
    init(vehiclesUrl: [String]) {
        self.vehiclesUrl = vehiclesUrl
    }
    
    func loadVehicle() {
        vehicleError = nil
        Publishers.MergeMany(vehiclesUrl.map( self.getVehicleUsecase.execute(params: ))).collect().receive(on: RunLoop.main).sink(receiveCompletion: { [weak self] error in
            if case .failure(let error) = error {
                print("Error \(error)")
                self?.vehicleError = error
            }
        }, receiveValue: { [weak self] vehicles in
            if self != nil {
                self!.vehicles = vehicles
            }
        }).store(in: &bag)
    }
}
