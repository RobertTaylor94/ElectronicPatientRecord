//
//  ObservationsViewModel.swift
//  EPR
//
//  Created by Christian Dacres on 26/02/2022.
//

import Foundation
import SwiftUI

extension ObservationsView {
    class ViewModel: ObservableObject {
        
        @ObservedObject var model = ObservationsModel()
        
        @Published var heartRateData: [Double] = [96, 102, 93]
        @Published var respRateData: [Double] = [33, 29, 31]
        @Published var satsData: [Double] = [99, 94, 100]
        @Published var heartRateMin: Int = 0
        @Published var heartRateMax: Int = 0
        
        func heartRateParameters(patientAge: Int) -> [Int] {
            
            switch patientAge {
                case 0...1:
                heartRateMin = 110
                heartRateMax = 159
                
                case 1...2:
                heartRateMin = 100
                heartRateMax = 149
                
                case 2...5:
                heartRateMin = 80
                heartRateMax = 119
                
                case 5...12:
                heartRateMin = 70
                heartRateMax = 119
                
            default:
                heartRateMin = 70
                heartRateMax = 99
            }
            
            return [heartRateMin, heartRateMax]
        }
        
        func pewsScore() {
            let heartRate: Int = Int(heartRateData.last!)
            
            if heartRate > heartRateMax {
                print("HR too high")
            }
        }
        
        
    }
}
