//
//  WriteView.swift
//  Journal
//
//  Created by Ariel-M-01 on 13/04/2021.
//

import Foundation
import SwiftUI
import CoreData



struct WriteView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var title: String = ""
    @State var text: String = ""
    @State var date: Date = Date()
    //@State private var goToEntriesView = false
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section(header: Text("Create your new journal entry").foregroundColor(Color("HeadersColor"))
                                .font(.title3))
                    {
                        TextField("Title", text: $title)
                        TextField("Text", text: $text)
                    }
                    Section(){
                        DatePicker(selection: $date, label: { Text("Date") })
                    }
                    Button(action: {
                        let newItem = Entry(context: viewContext)
                        newItem.date = date
                        newItem.title = title
                        newItem.text = text
                        title = ""
                        text = ""
                        date = Date()
                        
                        do {
                            try viewContext.save()
                        } catch {
                            // Replace this implementation with code to handle the error appropriately.
                            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                            let nsError = error as NSError
                            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                        }
                        //self.goToEntriesView = true
                    }, label: {
                        HStack {
                            Spacer()
                            Text("Save")
                            Spacer()
                        }
                    })
                    .disabled(title.isEmpty || text.isEmpty)
                }
                .navigationTitle("Write")
                //.background(
                //    NavigationLink(destination: EntriesView(), isActive: $goToEntriesView) { }
                //    .hidden()
                //)
            }
             
        }
    }
}

struct WriteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
