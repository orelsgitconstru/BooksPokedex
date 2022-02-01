//
//  Date+Extension.swift
//  MyBooks
//
//  Created by Orel Zilberman on 01/02/2022.
//

import Foundation

extension String{
    func toDate(withString: String, format: String = "yyyy-MM-dd") -> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: withString)
        return date
    }
}
