//
//  EntriesView.swift
//  Journal
//

import Foundation
import SwiftUI
import CoreData



struct EntriesView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Entry.date, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Entry>
    
    var body: some View {
        NavigationView{
            List {
                ForEach(items) { item in
                    Text("\(item.title!): \(item.date!, formatter: itemFormatter)")
                //ForEach (entries, id: \.title) { entry in
                //    NavigationLink(entry.title, destination: Text(entry.text))
                }.onDelete(perform: deleteItems)
            }

    
            .toolbar (content:{
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing){
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
                }
            )
        .navigationTitle("My story")
    
        }
        .listStyle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=List Style@*/DefaultListStyle()/*@END_MENU_TOKEN@*/)
    }
    
    

    private func addItem() {
        withAnimation {
            let newItem = Entry(context: viewContext)
            newItem.date = Date()
            newItem.title = "title"

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long 
    formatter.timeStyle = .none
    return formatter
}()

struct EntriesView_Previews: PreviewProvider {
    static var previews: some View {
        EntriesView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

