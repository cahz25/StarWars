//
//  PeopleList.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 21/07/22.
//

import Foundation

struct People: Codable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [Person]
}
