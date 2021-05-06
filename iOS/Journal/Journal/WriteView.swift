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
    @State var inspiration: String = ""
    @State var text: String = ""
    @State var date: Date = Date()
    @State var saved: Bool = false
    var body: some View {
        VStack {
            //Form {
              //  TextField(<#T##title: StringProtocol##StringProtocol#>, value: <#T##Binding<T>#>, formatter: <#T##Formatter#>)
            //}
            NavigationView {
                Form {
                    Section(header: Text("Create your new journal entry").foregroundColor(Color("HeadersColor"))
                        .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/))
                        {
                        TextField("Title", text: $title)
                        TextField("Inspiration", text: $inspiration)
                        TextField("Text", text: $text)
                    }
                    DatePicker(selection: $date, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
                    Button(action: {
                        let newItem = Entry(context: viewContext)
                        newItem.date = date
                        newItem.title = title
                        newItem.text = text
                        newItem.inspiration = inspiration

                        do {
                            try viewContext.save()
                        } catch {
                            // Replace this implementation with code to handle the error appropriately.
                            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                            let nsError = error as NSError
                            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                        }
                        self.saved = true
                    }, label: {
                        HStack {
                            Spacer()
                            Text(saved ? "Saved" : "Save")
                            Spacer()
                        }
                    }).disabled(saved)
                }.navigationBarTitle("Write")
                
            }
        }
    }
}



struct WriteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
