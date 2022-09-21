//
//  PeopleDetailsView.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 3/08/22.
//

import SwiftUI

struct PeopleDetailsView: View {
    @StateObject var viewModel: PeopleDetailsViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                ImageView(name: viewModel.person.name)
                    .scaledToFit()
                    .frame(width: 200, height: 200, alignment: .center)
                HStack {
                    VStack {
                        Text("Birth Year: \(viewModel.person.birthYear)")
                        Text("Height: \(viewModel.person.height)mts")
                        Text("Hair Color: \(viewModel.person.hairColor)")
                    }
                    VStack {
                        Text("Gender: \(viewModel.person.gender)")
                        Text("Mass: \(viewModel.person.mass)Kg")
                        Text("Skin Color: \(viewModel.person.skinColor)")
                    }
                }.padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                if viewModel.person.films.count > 0 {
                    PreviewFilmsView(viewModel: PreviewFilmsViewModel(filmsUrl: viewModel.person.films))
                }
                if viewModel.person.vehicles.count > 0 {
                    PreviewVehiclesView(viewModel: PreviewVehiclesViewModel(vehiclesUrl: viewModel.person.vehicles))
                }
                if viewModel.starships.count > 0 {
                    PreviewStarshipsView(starships: viewModel.starships)
                }
            }.navigationTitle(viewModel.person.name)
            
        }.task {
            viewModel.getDetails()
        }
    }
}

struct PeopleDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let luke = Person(name: "Luke", height: "10", mass: "10", hairColor: "yellow", skinColor: "white", eyeColor: "green", birthYear: "1991", gender: "Male", homeworld: "Earth", films: ["VII"], species: ["human"], vehicles: ["star"], starships: ["star"], created: "1991", edited: "1991", url: "http")
        
        let viewModel = PeopleDetailsViewModel(luke)
        PeopleDetailsView(viewModel: viewModel)
    }
}


