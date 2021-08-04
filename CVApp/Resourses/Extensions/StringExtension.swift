//
//  StringExtension.swift
//  CVApp
//
//  Created by Agustin Errecalde on 04/08/2021.
//

import Foundation


extension String {
    
    func convertToShortDate() -> String? {
        if self == "Actualidad" {
            return self
        }
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "dd/MM/yyyy"
        let date = dateFormatterGet.date(from: self)
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.locale = .current
        dateFormatterPrint.dateFormat = "MMM yyyy"
        
        guard let date = date else {
            return ""
        }
                
        return dateFormatterPrint.string(from: date)
    }

    
}
