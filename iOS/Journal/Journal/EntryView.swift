//
//  EntryV iew.swift
//  Journal
//

import Foundation
import SwiftUI

struct EntryView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var title: String = ""
    @State var text: String = ""
    @State var inspiration: String = ""
    @State var date: Date = Date()
    var body: some View {
            VStack {
                Text(title)
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .foregroundColor(Color("HeadersColor"))
                Spacer()
                Text("\(date, formatter: entryDateFormatter)")
                ScrollView{
                    Text(inspiration)
                        .font(.title3)
                        .fontWeight(.bold)
                    Text(text)
                }
            }
            .multilineTextAlignment(.center)
            .padding()
    }
}

private let entryDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .short
    return formatter
}()



struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView(title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Viverra accumsan in nisl nisi scelerisque eu. Dui accumsan sit amet nulla facilisi morbi tempus. Lacus vestibulum sed arcu non odio. Tincidunt eget nullam non nisi. Etiam dignissim diam quis enim. Faucibus ornare suspendisse sed nisi lacus sed viverra tellus in. Elit at imperdiet dui accumsan. Turpis in eu mi bibendum. Amet luctus venenatis lectus magna fringilla urna porttitor rhoncus dolor. Eu volutpat odio facilisis mauris sit. Porta non pulvinar neque laoreet suspendisse. Leo integer malesuada nunc vel risus commodo viverra. Mauris nunc congue nisi vitae suscipit tellus mauris a. Vel risus commodo viverra maecenas accumsan lacus vel facilisis volutpat.", inspiration: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Viverra accumsan in nisl nisi scelerisque eu. Dui accumsan sit amet nulla facilisi morbi tempus. Lacus vestibulum sed arcu non odio. Tincidunt eget nullam non nisi. Etiam dignissim diam quis enim. Faucibus ornare suspendisse sed nisi lacus sed viverra tellus in. Elit at imperdiet dui accumsan. Turpis in eu mi bibendum. Amet luctus venenatis lectus magna fringilla urna porttitor rhoncus dolor. Eu volutpat odio facilisis mauris sit. Porta non pulvinar neque laoreet suspendisse. Leo integer malesuada nunc vel risus commodo viverra. Mauris nunc congue nisi vitae suscipit tellus mauris a. Vel risus commodo viverra maecenas accumsan lacus vel facilisis volutpat.", date: Date()).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

