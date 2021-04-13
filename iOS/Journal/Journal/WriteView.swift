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
    var body: some View {
        HStack {
            //Form {
              //  TextField(<#T##title: StringProtocol##StringProtocol#>, value: <#T##Binding<T>#>, formatter: <#T##Formatter#>)
            //}
            DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
        }
    }
}

struct WriteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteView()
    }
}
