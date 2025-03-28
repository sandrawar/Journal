//
//  HomeView.swift
//  Journal
//


import Foundation
import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.init(red: 0.634, green: 0.290, blue: 0.287, opacity: 0.2), Color.init(red: 0.634, green: 0.290, blue: 0.287, opacity: 1.0)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea( edges: .top)
            VStack {
                Text("home-quote")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                Text("home-author")
                    .font(.title3)
                    .fontWeight(.bold)
                
            }
            .multilineTextAlignment(.center)
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
