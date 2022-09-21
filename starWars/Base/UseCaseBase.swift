//
//  UseCaseBase.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 27/07/22.
//

import Foundation

protocol UseCase {
    associatedtype P
    associatedtype R
    func execute(params: P) -> R
}
