//
//  ContentView.swift
//  MyBooks
//
//  Created by Orel Zilberman on 25/01/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View {
        LoginView()
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
