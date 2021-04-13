//
//  InspirationView.swift
//  Journal
//
//  Created by Ariel-M-01 on 12/04/2021.
//

import Foundation
import SwiftUI
import CoreData



struct InspirationView: View {
    
    let understandYourselfInspirations = ["Name the three biggest priorities in your life right now.",
        "What are your biggest fears?",
        "What would you do if you were granted three wishes?",
        "Do you have a secret talent you are hiding?"
    ]
    let yourGrouth = ["How have you grown this year?",
        "What are the most important life lessons you have learned?"]
    var body: some View {
        SwiftUI.NavigationView{
            List {
                Section(header: InspirationHeader(symbol: "moon.stars", name: "Understand Yourself")) {
                    ForEach (understandYourselfInspirations, id: \.self) { inspiration in
                    NavigationLink(inspiration, destination: WriteView())
                }
            }
                Section(header: InspirationHeader(symbol: "moon.stars", name: "Your Grouth")) {
                    ForEach (yourGrouth, id: \.self) { inspiration in
                    NavigationLink(inspiration, destination: WriteView())
                }
            }
            }
            .listStyle(GroupedListStyle())
        .navigationTitle("Find inspiration")
        
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
        .foregroundColor(.pink)
        .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
    }
}

struct InspirationView_Previews: PreviewProvider {
    static var previews: some View {
        InspirationView()
    }
}

