//
//  SettingsView.swift
//  Journal
//
import Foundation
import SwiftUI

struct SettingsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var preferredColorScheme: ColorScheme? = nil
    var body: some View {
    VStack {
        Text("settings").fontWeight(.bold)
            .font(.largeTitle)
        List {
            HStack {
                Image(systemName: "paintpalette")
                Text("settings-colour").fontWeight(.bold)
            }
            Button(action: {
                preferredColorScheme = .light
            }) {
                HStack {
                    Text("light-schema")
                    Spacer()
                    if preferredColorScheme == .light {
                        selectedImage
                    }
                }
            }

            Button(action: {
                preferredColorScheme = .dark
            }) {
                HStack {
                    Text("dark-schema")
                    Spacer()
                    if preferredColorScheme == .dark {
                        selectedImage
                    }
                }
            }
            Spacer()
            Link(destination: URL(string: UIApplication.openSettingsURLString)!){
                HStack {
                    Image(systemName: "quote.bubble")
                    Text("language-settings")
                        .fontWeight(.bold)
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .preferredColorScheme(preferredColorScheme)
        .navigationBarTitle("settings")
    }
    }
    var selectedImage: some View {
        Image(systemName: "checkmark")
            .foregroundColor(.blue)
    }
}
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

