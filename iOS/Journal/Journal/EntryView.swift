//
//  EntryV iew.swift
//  Journal
//

import Foundation
import SwiftUI

struct EntryView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var title: String = ""
    @State var text: String = ""
    @State var inspiration: String = ""
    @State var date: Date = Date()
    var body: some View {
            VStack {
                Text(title)
                    .fontWeight(.bold)
                    .font(.largeTitle)
                Text(inspiration)
                    .font(.title3)
                    .fontWeight(.bold)
                Text(text)
                
            }
            .foregroundColor(Color("HeadersColor"))
            .multilineTextAlignment(.center)
            .padding()
        }
}
struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView(title: "Test title", inspiration: "Inspiration").environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

