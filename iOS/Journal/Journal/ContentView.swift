//
//  ContentView.swift
//  Journal


import SwiftUI
import SwiftUI
import CoreData

struct ContentView: View {
    @State private var tabSelection = 1
    @ObservedObject var userSettings = UserSettings()

    var body: some View {
        TabView (selection: $tabSelection){
            HomeView()
                .tabItem {
                    VStack {
                        Text("tabitem-home")
                        Image(systemName: "house")
                    }
                }
                .tag(1)
            EntriesView()
                .tabItem {
                    VStack {
                        Text("tabitem-read")
                        Image(systemName: "books.vertical")
                    }
                }
                .tag(2)
            WriteView(tabSelection: $tabSelection)
                .tabItem {
                    VStack {
                        Text("tabitem-write")
                        Image(systemName: "pencil.and.outline")
                    }
                }
                .tag(3)
            InspirationView()
                .tabItem {
                    VStack {
                        Text("tabitem-find-inspiration")
                        Image(systemName: "lasso.sparkles")
                    }
                }
                .tag(4)
            SettingsView(userSettings: userSettings)
                .tabItem {
                    VStack {
                        Text("tabitem-settings")
                        Image(systemName: "gearshape.2")
                    }
                }
                .tag(5)
        }
        .foregroundColor(.accentColor)
        .preferredColorScheme(userSettings.colorScheme)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
                .environment(\.locale, .init(identifier: "en"))
            ContentView()
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
                .environment(\.locale, .init(identifier: "pl"))
       }
    }
}
