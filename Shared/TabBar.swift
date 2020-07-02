//
//  TabBar.swift
//  HGSwiftUIDemo
//
//  Created by Miro on 2020/7/3.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView() {
            HomeView().tabItem {
                Image(systemName: "house.fill")
                Text("HOME")
            }
            ContentView().tabItem {
                Image(systemName: "doc.text.fill")
                Text("CERTIFICATE")
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
