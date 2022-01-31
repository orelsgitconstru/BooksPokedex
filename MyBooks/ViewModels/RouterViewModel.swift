//
//  ContentViewModel.swift
//  MyBooks
//
//  Created by Orel Zilberman on 26/01/2022.
//

import Foundation

class ContentViewModel: ObservableObject{
    @Published var screen: Screens = .splash
    
    static var instance = ContentViewModel()
    
    private init(){}
}
