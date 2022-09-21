//
//  PreviewVehiclesView.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 1/09/22.
//

import SwiftUI

struct PreviewVehiclesView: View {
    @StateObject var viewModel: PreviewVehiclesViewModel
    
    var body: some View {
        VStack {
            Text("Vehicles").font(.title2)
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(viewModel.vehicles, id: \.uuid) {vehicle in
                        HorizontalCellView(name: vehicle.name)
                    }
                }
            }
        }.task {
            viewModel.loadVehicle()
        }
        
    }
}

struct PreviewVehiclesView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = PreviewVehiclesViewModel(vehiclesUrl: [])
        PreviewVehiclesView(viewModel: viewModel)
    }
}
