//
//  SettingsView.swift
//  Journal
//
import Foundation
import SwiftUI

struct SettingsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var userSettings: UserSettings

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
                    userSettings.colorScheme = .light
                }) {
                    HStack {
                        Text("light-schema")
                        Spacer()
                        if userSettings.colorScheme == .light {
                            selectedImage
                        }
                    }
                }
                Button(action: {
                    userSettings.colorScheme = .dark
                }) {
                    HStack {
                        Text("dark-schema")
                        Spacer()
                        if userSettings.colorScheme == .dark {
                            selectedImage
                        }
                    }
                }
                Button(action: {
                    userSettings.colorScheme = .none
                }) {
                    HStack {
                        Text("system-scheme")
                        Spacer()
                        if userSettings.colorScheme == .none {
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
            
            Link(destination: URL(string: "https://sandrawar.github.io/PublicInfo/JournalPrivacyPolicy")!, label: {
                Text("Privacy Policy")
            })
            .padding()
            Spacer()
        }
        .preferredColorScheme(userSettings.colorScheme)
        .navigationBarTitle("settings")
    }
    var selectedImage: some View {
        Image(systemName: "checkmark")
            .foregroundColor(.blue)
    }
}
struct SettingsView_Previews: PreviewProvider {
    @State static var userSettings = UserSettings()
    static var previews: some View {
        SettingsView(userSettings: userSettings).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

