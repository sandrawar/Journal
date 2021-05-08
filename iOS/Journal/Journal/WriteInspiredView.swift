//
//  WriteInspiredView.swift
//  Journal
//

import Foundation
import SwiftUI
import CoreData
import Combine

struct WriteInspiredView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var title: String = ""
    @State var inspirationKey: String = ""
    @State var text: String = ""
    @State var date: Date = Date()
    @Binding var selectedLink: String?
    @State private var showingAlert = false
    
    let titleLimit = 60
       
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("create-text").foregroundColor(Color("HeadersColor"))
                            .font(.title3))
                {
                    TextField("form-title", text: $title)
                        .onReceive(Just(title)) { _ in limitText(titleLimit) }
                    Text(LocalizedStringKey(inspirationKey))
                    ZStack {
                        Text(text).opacity(0).padding(.all, 8)
                        if text.isEmpty {
                            HStack{
                                Text("form-text")
                                    .opacity(0.6)
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                        }
                        TextEditor(text: $text)
                    }
                }
                Section(){
                    DatePicker(selection: $date, label: { Text("form-date") })
                }
                Button(action: {
                    let newItem = Entry(context: viewContext)
                    newItem.date = date
                    newItem.title = title
                    newItem.text = text
                    newItem.inspiration = NSLocalizedString(inspirationKey, comment: "")
                    inspirationKey = ""
                    title = ""
                    text = ""
                    date = Date()
                    
                    do {
                        try viewContext.save()
                        self.selectedLink = nil
                    } catch {
                        viewContext.delete(newItem)
                        showingAlert = true
                    }
                }, label: {
                    HStack {
                        Spacer()
                        Text("save-button")
                        Spacer()
                    }
                })
                .disabled(title.isEmpty || text.isEmpty)
                .alert(isPresented: $showingAlert){
                    Alert(title: Text("err-save-title"), message: Text("err-save-text"), dismissButton: .default(Text("err-save-btn"), action: {
                        self.selectedLink = nil
                    }))
                }
            }
            .navigationTitle("view-title-inspired-write")
        }
    }

    //Function to keep text length in limits
    func limitText(_ limit: Int) {
        if title.count > limit {
            title = String(title.prefix(limit))
        }
    }
}



struct WriteInspiredView_Previews: PreviewProvider {
   @State static var selected: String? = ""
   static var previews: some View {
    WriteInspiredView(selectedLink: $selected).preferredColorScheme(.light).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
