//
//  GoogleSearch.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 30/08/22.
//

import Foundation

struct GoogleSearchResponse: Codable {
    var items: [Item]
}

struct Item: Codable {
    var link: String
}
