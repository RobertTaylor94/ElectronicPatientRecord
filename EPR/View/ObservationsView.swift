//
//  ObservationsView.swift
//  EPR
//
//  Created by Christian Dacres on 26/02/2022.
//

import SwiftUI
import Charts

struct ObservationsView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    @State var heartRateData: [ChartDataEntry] = [
        ChartDataEntry(x: 1, y: 94),
        ChartDataEntry(x: 2, y: 102),
        ChartDataEntry(x: 3, y: 106),
        ChartDataEntry(x: 4, y: 91),
        ChartDataEntry(x: 5, y: 92)
    ]
    
    @State var respRateData: [ChartDataEntry] = [
        ChartDataEntry(x: 1, y: 27),
        ChartDataEntry(x: 2, y: 35),
        ChartDataEntry(x: 3, y: 31),
        ChartDataEntry(x: 4, y: 38),
        ChartDataEntry(x: 5, y: 29)
    ]
    
    @State var bloodPressureData: [CandleChartDataEntry] = [
        CandleChartDataEntry(x: 1, shadowH: 92, shadowL: 53, open: 92, close: 53),
        CandleChartDataEntry(x: 2, shadowH: 104, shadowL: 68, open: 104, close: 68),
        CandleChartDataEntry(x: 3, shadowH: 89, shadowL: 47, open: 89, close: 47),
        CandleChartDataEntry(x: 4, shadowH: 98, shadowL: 57, open: 98, close: 57)
    ]
    
    @State var temperatureData: [ChartDataEntry] = [
        ChartDataEntry(x: 1, y: 36.7),
        ChartDataEntry(x: 2, y: 36.3),
        ChartDataEntry(x: 3, y: 37.2),
        ChartDataEntry(x: 4, y: 36.9),
        ChartDataEntry(x: 5, y: 36.5)
    ]
    
    
    var body: some View {
        
        
        VStack {
            HStack(spacing: 40) {
                
                VStack {
                    Text("Heart Rate").font(.title)
                    Line(entries: heartRateData, title: "Heart Rate", yAxisMinimum: 40, yAxisMaximum: 140)
                        .frame(width: 200, height: 200)
                        .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 2)
                    )
                }
                
                VStack {
                    Text("Respiratory Rate")
                        .font(.title)
                    Line(entries: respRateData, title: "Respiratory Rate", yAxisMinimum: 0, yAxisMaximum: 60)
                        .frame(width: 200, height: 200)
                        .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 2)
                    )
                }
                
                
                
            }
            .padding()
            
            HStack(spacing: 40) {
                VStack {
                    Text("Blood Pressure")
                    CandleStick(entries: bloodPressureData)
                        .frame(width: 200, height: 200)
                        .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 2))
                }
                VStack {
                    Text("Temperature")
                    Line(entries: [], title: "Temperature", yAxisMinimum: 34, yAxisMaximum: 42)
                        .frame(width: 200, height: 200)
                        .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 2))
                }
            }
            
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
.previewInterfaceOrientation(.landscapeLeft)
    }
}
