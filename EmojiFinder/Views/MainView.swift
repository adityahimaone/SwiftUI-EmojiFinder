//
//  ContentView.swift
//  EmojiFinder
//
//  Created by Aditya Himawan on 25/01/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Group {
                EmojiFinder()
                    .tabItem {
                        Label("Emoji", systemImage: "poweroutlet.type.c.square")
                    }
                
                Text("Location View")
                    .tabItem {
                        Label("Location", systemImage: "binoculars.circle")
                    }
                
                Text("Settings View")
                    .tabItem {
                        Label("Settings", systemImage: "gear.circle")
                    }
            }
        }
        .tint(.black)
    }
}

#Preview {
    MainView()
}
