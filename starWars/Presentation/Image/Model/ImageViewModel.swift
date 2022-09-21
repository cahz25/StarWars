//
//  ImageViewModel.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 30/08/22.
//

import Foundation
import UIKit

class ImageViewModel: ObservableObject {
    let readerUseCase = GetImageUseCase(repository: ImageFileRepositoryImpl())
    let downloadUseCase = GetImageUseCase(repository: ImageAPIRepositoryImpl())
    
    @Published var fetching = false
    @Published var image: UIImage = UIImage()
    
    func load(name: String) {
        if let image = ImageCache.getImageCache().get(forKey: name) {
            self.image = image
        } else {
            var urlString = readerUseCase.execute(params: name)
            if urlString.isEmpty {
                urlString = downloadUseCase.execute(params: name)
            }
            guard let url = URL(string: urlString) else {return}
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else {return}
                DispatchQueue.main.async {
                    if let image = UIImage(data: data) {
                        self.image = image
                        ImageCache.getImageCache().set(forKey: name, image: image)
                    }
                }
            }
            task.resume()
        }
    }
}
