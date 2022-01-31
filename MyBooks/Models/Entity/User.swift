//
//  User.swift
//  MyBooks
//
//  Created by Orel Zilberman on 24/01/2022.
//

import Foundation

struct User{
    var uid: String
    var booksReadIds =  [String]()
    var readList = [String]() // Ids of books in the read list
    
    func getPagesRead() -> Int{
        return 111
    }
    
    func getBooksRead() -> Int {
        return booksReadIds.count
    }
}
