//
//  EntriesView.swift
//  Journal
//
//  Created by Ariel-M-01 on 11/04/2021.
//

import Foundation
import SwiftUI
import CoreData



struct EntriesView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    let entries = [Entry(date: Date(),text: "1",title: "First",inspiration: nil),
                 Entry(date: Date(),text: "2",title: "Second",inspiration: nil),
                 Entry(date: Date(),text: "3",title: "Third",inspiration: nil)]

    var body: some View {
        NavigationView{
            List {
                //ForEach(items) { item in
                   //Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                    //Text("Item at \(Item(timestamp: Date(), date: Date(),text: "1",title: "First",inspiration: nil), formatter: itemFormatter)")
                //.onDelete(perform: deleteItems)
                ForEach (entries, id: \.title) { entry in
                    NavigationLink(entry.title, destination: Text(entry.text))
                }.onDelete(perform: deleteItems)
            }
            //.background(Color.red)

    
            .toolbar (content:{
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing){
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
                }
            )
        .navigationTitle("My story")
        //.background(Color.green)
    
        }
        .listStyle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=List Style@*/DefaultListStyle()/*@END_MENU_TOKEN@*/)
    }
    
    

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            //newItem.date = Date()

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
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct EntriesView_Previews: PreviewProvider {
    static var previews: some View {
        //EntriesView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        EntriesView()
    }
}

