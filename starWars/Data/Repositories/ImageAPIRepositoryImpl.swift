//
//  ImageRepositoryIml.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 30/08/22.
//

import Foundation

class ImageAPIRepositoryImpl: ImageRepository {
    func getUrlImage(name: String) -> String {
        let escapeName = "wikia+\(name.replacingOccurrences(of: " ", with: "+"))"
        if let url = URL(string: "https://www.googleapis.com/customsearch/v1?key=AIzaSyBJgM7J3cFbZAKLvj3MRHH6QS3AbdLote0&cx=a7150d9c4b89cdc67&q=\(escapeName)&searchType=image&alt=json") {
            
            guard let data = try? Data(contentsOf: url) else {
                return String.Empty
            }
            
            guard let result = try? JSONDecoder().decode(GoogleSearchResponse.self, from: data) else {
                return String.Empty
            }
            
            return result.items.first?.link ?? String.Empty
        }
        return String.Empty
    }
}
