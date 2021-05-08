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
    @State private var showingAlert = false

    var body: some View {
         NavigationView{
            List {
                ForEach(items) { entry in
                    NavigationLink("\(entry.date!, formatter: entryDateFormatter): \(entry.title!)", destination: EntryView(title: entry.title!, text: entry.text ?? "", inspiration: entry.inspiration ?? "", date: entry.date!))
                }.onDelete(perform: deleteItems)
            }
            .navigationTitle("entries-title")
            .listStyle(GroupedListStyle())
            .accessibilityScrollAction { edge in /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*/ /*@END_MENU_TOKEN@*/  }
            .alert(isPresented: $showingAlert){
                Alert(title: Text("err-save-title"), message: Text("err-save-text"), dismissButton: .default(Text("err-save-btn")))
            }
        }
     }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                showingAlert = true
            }
        }
    }
}

private let entryDateFormatter: DateFormatter = {
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

