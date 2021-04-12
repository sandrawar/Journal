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
    
    let inspirations = ["Describe"]
    var body: some View {
        NavigationView{
            List {
                ForEach (inspirations, id: \.self) { inspiration in
                    NavigationLink(inspiration, destination: Text(inspiration))
                }
            }
        .navigationTitle("Find inspiration")
        
        }
    }
    

    
    }



struct InspirationView_Previews: PreviewProvider {
    static var previews: some View {
        InspirationView()
    }
}

