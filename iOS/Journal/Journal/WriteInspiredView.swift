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
    @State private var showingSaveErrorAlert = false
    @State private var showingResetAlert = false

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
            }
            .navigationTitle("view-title-inspired-write")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Clear") {
                        showingResetAlert = true
                     }
                    .disabled(title.isEmpty && text.isEmpty)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        let newItem = Entry(context: viewContext)
                        newItem.date = date
                        newItem.title = title
                        newItem.text = text
                        newItem.inspiration = NSLocalizedString(inspirationKey, comment: "")

                        do {
                            try viewContext.save()
                            self.title = ""
                            self.text = ""
                            self.date = Date()
                        } catch {
                            viewContext.delete(newItem)
                            showingSaveErrorAlert = true
                        }
                     }
                    .disabled(title.isEmpty || text.isEmpty)
                }
            })
        }
        .alert(isPresented: $showingSaveErrorAlert){
            Alert(title: Text("err-save-title"), message: Text("err-save-text"), dismissButton: .default(Text("err-save-btn")))
        }
        .alert(isPresented: $showingResetAlert, content: {
            Alert(title: Text("data-clear-title"), message: Text("data-clear-message?"), primaryButton: .cancel(), secondaryButton: .destructive(Text("data-clear-confirm"), action: {
                self.title = ""
                self.text = ""
                self.date = Date()
            }))})
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
