//
//  ContentView.swift
//  Journal


import SwiftUI
import SwiftUI
import CoreData

struct ContentView: View {
    //@State private var bgColor = Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    @State private var tabSelection = 1
    var body: some View {
        TabView (selection: $tabSelection){
            HomeView()
                .tabItem {
                    VStack {
                        Text("Home")
                        Image(systemName: "house")
                    }
                }
                .tag(1)
            EntriesView()
                .tabItem {
                    VStack {
                        Text("read")
                        Image(systemName: "books.vertical")
                    }
                }
                .tag(2)
            WriteView(tabSelection: $tabSelection)
                .tabItem {
                    VStack {
                        Text("write")
                        Image(systemName: "pencil.and.outline")
                    }
                }
                .tag(3)
            InspirationView()
                .tabItem {
                    VStack {
                        Text("Find inspiration")
                        Image(systemName: "lasso.sparkles")
                    }
                }
                .tag(4)
            SettingsView()
                .tabItem {
                    VStack {
                        Text("Settings")
                        Image(systemName: "gearshape.2")
                    }
                }
                .tag(5)
        }
        .foregroundColor(.accentColor)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
