//
//  ContentView.swift
//  Journal
//
//  Created by Ariel-M-01 on 10/04/2021.
//

import SwiftUI
import SwiftUI
import CoreData

struct ContentView: View {
@State private var bgColor =
        Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    var body: some View {
        TabView {
            Text("Journal").tabItem {
                VStack {
                    Text("Home")
                    Image(systemName: "house")
            }
            }
            
            EntriesView().tabItem {
                VStack {
                    Text("read")
                    Image(systemName: "books.vertical")
            }
            }
            
            EntriesView().tabItem {
                VStack {
                    Text("write")
                    Image(systemName: "pencil.and.outline")
            }
            }
            
            EntriesView().tabItem {
                VStack {
                    Text("Find inspiration")
                    Image(systemName: "lasso.sparkles")
            }
            }
            
            ColorPicker("Alignment Guides", selection: $bgColor).tabItem {
                VStack {
                    Text("Settings")
                    Image(systemName: "gearshape.2")
                }
            }

            
        }
        
}
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
