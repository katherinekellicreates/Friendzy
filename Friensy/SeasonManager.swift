//
//  SeasonManager.swift
//  Friensy
//
//  Created by Katherine Pizzirusso on 4/30/26.
//

import Foundation
import CoreLocation

struct SeasonManager {
    
    static func season(for date: Date = Date(), latitude: Double) -> Season {
        
        let calendar = Calendar.current
        let month = calendar.component(.month, from: date)
        
        let isSouthernHemisphere = latitude < 0
        
        switch month {
        case 12, 1, 2:
            return isSouthernHemisphere ? .summer: .winter
        case 3, 4, 5:
            return isSouthernHemisphere ? .fall: .spring
        case 6, 7, 8:
            return isSouthernHemisphere ? .winter: .summer
        case 9, 10, 11:
            return isSouthernHemisphere ? .spring: .fall
        default:
            return .summer
        }
    }
}
