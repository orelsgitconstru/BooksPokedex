//
//  Input.swift
//  MyBooks
//
//  Created by Orel Zilberman on 24/01/2022.
//

import SwiftUI

struct Input: View {
    @Binding var text: String
    var title: String
    var placeholderText: String
    var leftIcon: Image?
    var rightIcon: Image?
    var onSubmit: () -> Void = {  }
    
    private let height: CGFloat = 47
    private let iconWidth: CGFloat = 18
    private let iconHeight: CGFloat = 18
        
    var body: some View {
        HStack{
            if(leftIcon != nil){
                leftIcon!
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: iconWidth, height: iconHeight)
                    .foregroundColor(.secondary)
            }
            TextField(
                placeholderText,
                text: $text
            )
                .textFieldStyle(DefaultTextFieldStyle())
                .lineLimit(1)
                .foregroundColor(.primary) // Text color
                .onSubmit {
                    onSubmit()
                }
                .font(.system(size: 24, design: .default))
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
        }.padding(20)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(.white.opacity(1)))
            .padding(20)
            .shadow(color: .black.opacity(0.2), radius: 5, x: 5, y: 10)
    }
}
