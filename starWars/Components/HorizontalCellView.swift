//
//  HorizontalCellView.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 30/08/22.
//

import SwiftUI

struct HorizontalCellView: View {
    var name: String
    
    var body: some View {
        HStack {
            ImageView(name: name)
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
            Text(name)
        }
    }
}

struct HorizontalCellView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalCellView(name: "Cesar")
    }
}
