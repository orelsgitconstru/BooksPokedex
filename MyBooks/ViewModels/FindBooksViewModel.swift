//
//  MainViewModel.swift
//  MyBooks
//
//  Created by Orel Zilberman on 31/01/2022.
//

import Foundation

class FindBooksViewModel: ObservableObject {
    static let shared: FindBooksViewModel = FindBooksViewModel()
    
    @Published var searchedBooks = [Book]()
    
    @Published var searchText = "" {
        didSet{
            onSearchTextChange()
        }
    }
    private var searchTextDebounceTimer:Timer?
    
    func onSearchTextChange(){
        searchTextDebounceTimer?.invalidate()
        searchTextDebounceTimer = Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false){[weak self] _ in
            self?.findBooks()
        }
    }

    func findBooks(){
        if let url =  buildSearchURL(searchWith: searchText)
        {
            let task = URLSession.shared.dataTask(with: url) {[weak self] (data, response, error) in
                guard let data = data else {
                    return
                }
                DispatchQueue.main.async {
                    self?.searchedBooks = Book.googleBooksToBookList(data: data)
                }
                
            }
            task.resume()
        }
    }
    
    private func buildSearchURL(searchWith: String, language: String = "en") -> URL? {
        return URL(string: "https://www.googleapis.com/books/v1/volumes?q=\(searchWith.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)&maxResults=20&langRestrict=\(language)&key=AIzaSyAyH7CvHZd5lhtiXXVcxdUliGTOwxxMkZc")
    }
    
    private init(){}
}
