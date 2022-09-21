//
//  CellView.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 21/07/22.
//

import SwiftUI

struct CellView: View {
    var title: String
    var subtitle: String
    var body: some View {
        HStack {
            ImageView(name: title)
                .scaledToFill()
                .frame(width: 40, height: 40, alignment: .center)
                .clipShape(Circle())
                .shadow(radius: 10)
            VStack {
                Text(title)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(subtitle)
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
        }
        
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(title: "Hola", subtitle: "Hurtado")
    }
}
