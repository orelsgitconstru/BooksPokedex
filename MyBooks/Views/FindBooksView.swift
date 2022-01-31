//
//  Main.swift
//  MyBooks
//
//  Created by Orel Zilberman on 25/01/2022.
//

import SwiftUI

struct FindBooksView: View {
    @ObservedObject var booksManager: BooksManager = .shared
    @State var books = [Book]()
    @State var selectedBook: Book? = nil
    
    var body: some View {
            ZStack{
                VStack
                {
                    Button(action: logout){
                        Text("logout")
                    }
                    if(booksManager.books.isEmpty){
                        ProgressView().frame(width: 80, height: 80, alignment: .center)
                    }
                    List(booksManager.books){ book in
                        BookRow(book: book).onTapGesture {
                            selectedBook = book
                        }
                    }.sheet(item: $selectedBook, onDismiss: bookScreenDidDismiss){
                        book in
                        BookSelected(book: book)
                    }
                }
            }
    }
    
    func bookScreenDidDismiss(){
        selectedBook = nil
    }
    
    mutating func setBooks(books data: [Book]){
        books = data
    }
    
    func logout(){
        LoginViewModel.shared.logout()
    }
    
    struct Main_Previews: PreviewProvider {
        static var previews: some View {
            FindBooksView()
        }
    }
}
