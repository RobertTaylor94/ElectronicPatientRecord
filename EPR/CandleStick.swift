//
//  CandleStick.swift
//  EPR
//
//  Created by Christian Dacres on 26/02/2022.
//

import Foundation
import SwiftUI
import Charts

struct CandleStick: UIViewRepresentable {
    func makeUIView(context: Context) -> CandleStickChartView {
        let chart = CandleStickChartView()
        chart.data = addData()
        chart.legend.enabled = false
        
        return chart
    }
    
    func updateUIView(_ uiView: CandleStickChartView, context: Context) {
        uiView.data = addData()
    }
    
    func addData() -> CandleChartData {
        let data = CandleChartData()
        let dataSet = CandleChartDataSet(entries: entries)
        dataSet.colors = [NSUIColor.green]
        dataSet.label = "Blood Pressure"
        dataSet.barSpace = 0.7
        dataSet.decreasingFilled = true
        dataSet.decreasingColor = .green
        dataSet.increasingFilled = true
        dataSet.increasingColor = .green
        data.addDataSet(dataSet)
        
        return data
    }
    
    

    var entries: [CandleChartDataEntry]
    
    
    
    typealias UIViewType = CandleStickChartView
}

struct CandleStick_Previews: PreviewProvider {
    static var previews: some View {
        CandleStick(entries: [
            CandleChartDataEntry(x: 1, shadowH: 100, shadowL: 79, open: 79, close: 100),
            CandleChartDataEntry(x: 2, shadowH: 100, shadowL: 79, open: 79, close: 100)
        ])
    }
}
