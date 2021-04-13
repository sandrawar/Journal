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
        
        VStack {
            TabView {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color.init(red: 0.634, green: 0.290, blue: 0.287, opacity: 0.2), Color.init(red: 0.634, green: 0.290, blue: 0.287, opacity: 1.0)]), startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea( edges: .top)
                    VStack {
                        Text("\"Journaling is like whispering to one's self and listening at the same time.\"")
                            .fontWeight(.bold)
                            .font(.largeTitle)
                        Text("- Mina Murray")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                    }
                    .multilineTextAlignment(.center)
                    .padding()
                }.tabItem {
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
                    
                    WriteView().tabItem {
                        VStack {
                            Text("write")
                            Image(systemName: "pencil.and.outline")
                    }
                    }
                    
                    InspirationView().tabItem {
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
            .foregroundColor(.accentColor)
        }
        
        
}
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
            
            
    }
}
