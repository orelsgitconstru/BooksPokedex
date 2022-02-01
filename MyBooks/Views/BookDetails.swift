//
//  BookSelected.swift
//  MyBooks
//
//  Created by Orel Zilberman on 30/01/2022.
//

import SwiftUI

struct BookDetails: View {
    var book: Book?
    
    var body: some View {
        if(book == nil){Text("No book selected.")}
        else {
            ZStack{
                VStack{
                    CustomImage(imageURL: book?.buildThumbnailURL(), height: 300, width: 300)
                    Text("Pages: \(book?.pageCount ?? 0)")
                    Text("Description: \(book?.description ?? "")")
                }
            }
        }
    }
}

struct BookSelected_Previews: PreviewProvider {
    static var previews: some View {
        BookDetails()
    }
}
