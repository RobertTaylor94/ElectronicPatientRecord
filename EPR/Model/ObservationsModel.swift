//
//  ObservationsModel.swift
//  EPR
//
//  Created by Christian Dacres on 26/02/2022.
//

import Foundation
import SwiftUI

extension ObservationsView {
    
class ObservationsModel: ObservableObject {
    
    @Published var heartRateMin: Int = 0
    @Published var heartRateMax: Int = 0
    
    enum Parameters {
        case underFourMonths
        case fourMonthsToTwo
        case twoToFive
        case fiveToTwelve
        case overTwelve
    }
    
    func heartRateParameters(type: Parameters) -> (heartRateMaximum: Int, heartRateMinimum: Int) {
        
        var heartRateMinimum: Int
        var heartRateMaximum: Int
        
        switch type {
            case .underFourMonths:
            heartRateMaximum = 159
            heartRateMinimum = 110
            case .fourMonthsToTwo:
            heartRateMaximum = 149
            heartRateMinimum = 100
            case .twoToFive:
            heartRateMaximum = 119
            heartRateMinimum = 80
            case .fiveToTwelve:
            heartRateMaximum = 119
            heartRateMinimum = 70
            case .overTwelve:
            heartRateMaximum = 99
            heartRateMinimum = 70
        }
        return (heartRateMaximum, heartRateMinimum)
    }
}
}
