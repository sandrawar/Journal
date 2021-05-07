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
                    NavigationLink("\(item.title!): \(item.date!, formatter: itemFormatter)", destination: EntryView(title:item.title!, text:item.text ?? "", inspiration:item.inspiration ?? "", date:item.date!))
                }.onDelete(perform: deleteItems)
            }
            .navigationTitle("My story")
            .listStyle(GroupedListStyle())
            .accessibilityScrollAction { edge in /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*/ /*@END_MENU_TOKEN@*/  }
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

