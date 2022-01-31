//
//  BookRow.swift
//  MyBooks
//
//  Created by Orel Zilberman on 27/01/2022.
//

import SwiftUI
import RealmSwift

struct BookView: View {
    var book: Book
    
    var body: some View {
        HStack{
            CustomImage(imageURL: book.thumbnail, height: 50, width: 50)
            VStack(alignment: .leading, spacing: 6){
                Text(book.title)
                Text(book.authors.first ?? "th")
                    .foregroundColor(.gray)
                    
            }
        }
    }
}

struct BookRow_Previews: PreviewProvider {
    static let book = Book(id: "id", title: "title_new", description: "description", publishedDate: Date(), pageCount: 1, thumbnail: "http://books.google.com/books/content?id=zCWzCwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api")
//    static let emptyBook = Book(id: "", title: "", authors:[String](), description: "", publishedDate: Date(), pageCount: -1, thumbnail: "")
    
    static var previews: some View {
        BookView(book: book)
    }
}
