//
//  UserSettings.swift
//  Journal
//

import Foundation
import SwiftUI

class UserSettings: ObservableObject {
    @Published var colorScheme: ColorScheme? {
        didSet {
            var colorSchemeName = ""
            if self.colorScheme == .dark{
                colorSchemeName = "dark"
            }
            else if self.colorScheme == .light{
                colorSchemeName = "light"
            }
            
            UserDefaults.standard.set(colorSchemeName, forKey: "colorScheme")
        }
    }
    
    init() {
        var savedColorScheme : ColorScheme? = nil
        let colorSchemeName = UserDefaults.standard.object(forKey: "colorScheme") as? String
        if colorSchemeName == "dark"{
            savedColorScheme = .dark
        }
        else if colorSchemeName == "light"{
            savedColorScheme = .light
        }
        self.colorScheme = savedColorScheme
    }
}
