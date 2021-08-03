//
//  DoubleExtension.swift
//  CVApp
//
//  Created by Agustin Errecalde on 03/08/2021.
//
import SwiftUI

extension Double {
    var percentStyle: String {
        let percent = NSNumber(value: self*100.00)
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.multiplier = 1
        formatter.minimumIntegerDigits = 1
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        guard let str = formatter.string(from: percent) else {
            return ""
        }
        
        return str
        
    }
    
    var widthPercentage: CGFloat {
        let fullWidht = UIScreen.main.bounds.width
        let percent = self
        
        return percent*fullWidht
    }
}
