//
//  PeopleRouter.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 30/08/22.
//

import Foundation

final class PeopleRouter {
    public static func showList() -> PeopleListView {
        PeopleListView()
    }
    
    public static func showDetail(person: Person) -> PeopleDetailsView {
        PeopleDetailsView(viewModel: PeopleDetailsViewModel(person))
    }
}
