//
//  ImageRepository.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 30/08/22.
//

import Foundation

protocol ImageRepository {
    func getUrlImage(name: String) -> String
}
