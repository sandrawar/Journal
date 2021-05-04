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
    @State var title: String = ""
    @State var inspiration: String = ""
    @State var text: String = ""
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
                    DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
                    Button(action: {
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
        WriteView()
    }
}
