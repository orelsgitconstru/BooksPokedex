//
//  TabView.swift
//  MyBooks
//
//  Created by Orel Zilberman on 30/01/2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        SwiftUI.TabView {
            AllBooksView()
                .tabItem{
                    Label("Main", systemImage: "house.fill")
                }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
