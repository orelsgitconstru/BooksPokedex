//
//  Plist.swift
//  MyBooks
//
//  Created by Orel Zilberman on 25/01/2022.
//

import Foundation

struct Plist{
    
    struct Credentials{
        static var nsDictionary: NSDictionary? =
        NSDictionary(contentsOfFile: Bundle.main.path(forResource: "credentials", ofType: "plist") ?? "")
        
        static var clientId: String? {
            get {
                return nsDictionary?.object(forKey: "CLIENT_ID") as? String
            }
        }
    }
    
    
}
