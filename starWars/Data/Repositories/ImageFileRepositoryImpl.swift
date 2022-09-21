//
//  ImageFileRepositoryImpl.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 30/08/22.
//

import Foundation

class ImageFileRepositoryImpl {
    
    var data: [ImageFileItem]
    
    init() {
        self.data = [ImageFileItem]()
        if let path = Bundle.main.path(forResource: "images", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                guard let result = try? JSONDecoder().decode([ImageFileItem].self, from: data) else {
                    return
                }
                
                self.data = result
                
            } catch {
                print(error)
            }
        }
    }
}

extension ImageFileRepositoryImpl: ImageRepository {
    func getUrlImage(name: String) -> String {
        return self.data.first(where: {$0.name.elementsEqual(name)})?.image ?? String.Empty
    }
}
