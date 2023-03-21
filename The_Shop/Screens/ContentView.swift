//
//  ContentView.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 05.03.23.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
           ParentView()
        }
        .background(Color.black) // Ändert die Hintergrundfarbe des VStacks zu blau
       
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
