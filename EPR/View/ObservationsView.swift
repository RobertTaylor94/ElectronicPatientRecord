//
//  ObservationsView.swift
//  EPR
//
//  Created by Christian Dacres on 26/02/2022.
//

import SwiftUI

struct ObservationsView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        
        VStack {
            HStack(spacing: 40) {
                LineGraphSummaryView(title: "Heart Rate", legend: "\(viewModel.heartRateData.last!) bpm", data: viewModel.heartRateData)
                LineGraphSummaryView(title: "Resp Rate", legend: "\(viewModel.respRateData.last!) bpm", data: viewModel.respRateData)
                LineGraphSummaryView(title: "SpO2", legend: "\(viewModel.satsData.last!) %", data: viewModel.satsData)
            }
            .padding()
            
        }
        .padding()
        .onAppear {
            print(viewModel.heartRateParameters(patientAge: 15).self)
            print(viewModel.pewsScore())
        }
    }
}

struct ObservationsView_Previews: PreviewProvider {
    static var previews: some View {
        ObservationsView()
    }
}
