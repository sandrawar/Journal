//
//  WriteView.swift
//  Journal


import Foundation
import SwiftUI
import CoreData



struct WriteView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var title: String = ""
    @State var text: String = ""
    @State var date: Date = Date()
    //@State private var goToEntriesView = false
    @Binding var tabSelection: Int
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("create-text").foregroundColor(Color("HeadersColor"))
                            .font(.title3))
                {
                    TextField("form-title", text: $title)
                    TextField("form-text", text: $text)
                }
                Section(){
                    DatePicker(selection: $date, label: { Text("form-date") })
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
                    self.tabSelection = 2
                    //self.goToEntriesView = true
                }, label: {
                    HStack {
                        Spacer()
                        Text("save-button")
                        Spacer()
                    }
                })
                .disabled(title.isEmpty || text.isEmpty)
            }
            .navigationTitle("view-title-write")
            //.background(
            //    NavigationLink(destination: EntriesView(), isActive: $goToEntriesView) { }
            //    .hidden()
            //)
        }
    }
}

struct WriteView_Previews: PreviewProvider {
    @State static var tabSelection = 1
    static var previews: some View {
        WriteView(tabSelection: $tabSelection).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
