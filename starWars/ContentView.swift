//
//  ContentView.swift
//  starWars
//
//  Created by Cesar Augusto Hurtado Zapata on 21/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PeopleRouter.showList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
