//
//  MyBooksApp.swift
//  MyBooks
//
//  Created by Orel Zilberman on 25/01/2022.
//

import SwiftUI
import Firebase

@main
struct MyBooksApp: App {
    let persistenceController = PersistenceController.shared

    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
