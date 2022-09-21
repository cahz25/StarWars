//
//  FilmRouter.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 30/08/22.
//

import Foundation

final class FilmRouter {
    
    public static func showDetail(film: Film) -> FilmDetailsView {
        FilmDetailsView(viewModel: FilmDetailsViewModel(film))
    }
}
