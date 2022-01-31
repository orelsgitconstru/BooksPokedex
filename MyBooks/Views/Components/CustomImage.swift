//
//  Image.swift
//  MyBooks
//
//  Created by Orel Zilberman on 30/01/2022.
//

import SwiftUI

struct Image: View {
    
    var imageURL: String?
    var height: CGFloat = 50
    var width: CGFloat = 50
    
    
    var body: some View {
        if(imageURL == nil){Text("No image selected")}
        else {
            AsyncImage(url: URL(string: imageURL!)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: width, height: height)
        }
    }
}

struct Image_Previews: PreviewProvider {
    static var previews: some View {
        Image()
    }
}
