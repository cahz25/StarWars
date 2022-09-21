//
//  ImageView.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 30/08/22.
//

import SwiftUI

struct ImageView: View {
    
    @StateObject var model: ImageViewModel = ImageViewModel()
    var name: String
    
    var body: some View {
        Image(uiImage: model.image)
            .resizable()
            .centerCropped()
            .task {
                model.load(name: name)
            }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(name: "yoda")
    }
}
