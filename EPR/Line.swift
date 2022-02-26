//
//  Line.swift
//  EPR
//
//  Created by Christian Dacres on 26/02/2022.
//

import Foundation
import Charts
import SwiftUI

struct Line : UIViewRepresentable {

    var entries: [ChartDataEntry]
    var title: String = ""
    var yAxisMinimum: Int = 40
    var yAxisMaximum: Int = 140
    
    func makeUIView(context: Context) -> LineChartView {
        let chart = LineChartView()
        chart.data = addData()
        chart.autoScaleMinMaxEnabled = false
        chart.gridBackgroundColor = .white
        chart.legend.enabled = false
        
        let xAxis = chart.xAxis
        xAxis.labelCount = entries.count
        xAxis.drawLabelsEnabled = false
        xAxis.drawAxisLineEnabled = false
        
        let yAxis = chart.leftAxis
        yAxis.axisMinimum = Double(yAxisMinimum)
        yAxis.axisMaximum = Double(yAxisMaximum)
        yAxis.labelCount = 11
        
        return chart
    }
    

    func updateUIView(_ uiView: LineChartView, context: Context) {
        //when data changes chartd.data update is required
        uiView.data = addData()
    }
    
    func addData() -> LineChartData {
        let data = LineChartData()
        let dataSet = LineChartDataSet(entries: entries)
        dataSet.colors = [NSUIColor.systemPink]
        dataSet.label = title
        data.addDataSet(dataSet)
        dataSet.lineWidth = 3
        return data
    }
    
    typealias UIViewType = LineChartView
    
}



struct Bar_Previews: PreviewProvider {
    static var previews: some View {
        Line(entries: [
            //x - position of a bar, y - height of a bar
            ChartDataEntry(x: 1, y: 94),
            ChartDataEntry(x: 2, y: 102),
            ChartDataEntry(x: 3, y: 98),
            ChartDataEntry(x: 4, y: 89),
            ChartDataEntry(x: 5, y: 93)

        ])
    }
}
