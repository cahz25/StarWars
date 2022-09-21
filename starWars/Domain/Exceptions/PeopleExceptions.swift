//
//  PeopleExceptions.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 28/07/22.
//

import Foundation

enum PeopleExceptions: Error {
    case list
}

extension PeopleExceptions: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .list:
            return NSLocalizedString("Something went wrong", comment: "Error getting List")
        }
    }
}
