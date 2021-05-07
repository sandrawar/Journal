//
//  InspirationView.swift
//  Journal


import Foundation
import SwiftUI
import CoreData

struct InspirationView: View {
    
    //https://thoughtcatalog.com/
    
    let understandYourselfInspirations = [
        "insp-u01",
        "insp-u02",
        "insp-u03",
        "insp-u04",
        "insp-u05",
        "insp-u06",
        "insp-u07",
        "insp-u08",
        "insp-u09",
        "insp-u10",
        "insp-u11",
        "insp-u12",
        "insp-u13",
        "insp-u14",
        "insp-u15",
        "insp-u16",
        "insp-u17",
        "insp-u18",
    ]
    
    let yourGrowth = [
        "insp-g01",
        "insp-g02",
        "insp-g03",
        "insp-g04",
        "insp-g05",
        "insp-g06",
        "insp-g07",
        "insp-g08",
        "insp-g09",
        "insp-g10",
        "insp-g11",
        "insp-g12",
        "insp-g13",
        "insp-g14",
        "insp-g15",
        "insp-g16",
        "insp-g17",
        "insp-g18",
        "insp-g19",
    ]
    
    let findYourBalance = [
        "insp-b01",
        "insp-b02",
        "insp-b03",
        "insp-b04",
        "insp-b05",
        "insp-b06",
        "insp-b07",
        "insp-b08",
        "insp-b09",
        "insp-b10",
        "insp-b11",
        "insp-b12",
        "insp-b13",
    ]
    let relationshipsWithOthers = [
        "insp-r01",
        "insp-r02",
        "insp-r03",
        "insp-r04",
        "insp-r05",
    ]
    
    @State private var writeInspired = false
    
    var body: some View {
        NavigationView{
            List {
                Section(header: InspirationHeader(symbol: "heart", name: "insp-sect-u")) {
                    ForEach (understandYourselfInspirations, id: \.self) { inspiration in
                        NavigationLink(LocalizedStringKey(inspiration), destination: WriteInspiredView(inspiration: inspiration, showSelf: $writeInspired), isActive: $writeInspired)
                    }
                }
                Section(header: InspirationHeader(symbol: "leaf", name: "insp-sect-g")) {
                    ForEach (yourGrowth, id: \.self) { inspiration in
                        NavigationLink(LocalizedStringKey(inspiration), destination: WriteInspiredView(inspiration: inspiration, showSelf: $writeInspired), isActive: $writeInspired)
                   }
                }
                Section(header: InspirationHeader(symbol: "tornado", name:"insp-sect-b" )) {
                    ForEach (findYourBalance, id: \.self) { inspiration in
                        NavigationLink(LocalizedStringKey(inspiration), destination: WriteInspiredView(inspiration: inspiration, showSelf: $writeInspired), isActive: $writeInspired)
                   }
                }
                Section(header: InspirationHeader(symbol: "person.2", name: "insp-sect-r")) {
                    ForEach (relationshipsWithOthers, id: \.self) { inspiration in
                        NavigationLink(LocalizedStringKey(inspiration), destination: WriteInspiredView(inspiration: inspiration, showSelf: $writeInspired), isActive: $writeInspired)
                    }
                }
            }
            .navigationTitle("Your prompts")
            .listStyle(GroupedListStyle())
            .accessibilityScrollAction { edge in /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*/ /*@END_MENU_TOKEN@*/  }
        }
    }
}

struct InspirationHeader: View {
    let symbol: String
    let name: String
    var body: some View {
        HStack {
            Image(systemName: symbol)
            Text(name)
        }
        .foregroundColor(Color("HeadersColor"))
        .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
    }
}

struct InspirationView_Previews: PreviewProvider {
    static var previews: some View {
        InspirationView()
            .preferredColorScheme(.dark)
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

