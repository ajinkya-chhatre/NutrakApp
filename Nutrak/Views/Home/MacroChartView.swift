//
//  MacroChartView.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 06/02/25.
//

import Foundation
import SwiftUI
import DGCharts


struct MacroChartView: View {
    let macroData: MacroData

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    PieChartView(values: [macroData.protein, macroData.carbs, macroData.fats],
                                 colors: [Color(hex: Constants.Colors.primaryGreen), Color(hex: Constants.Colors.vibrantOrange), Color(hex: "#6DA0FF")],
                                 names: ["Protein", "Carbs", "Fats"])
                        .frame(width: 120, height: 120)

                    VStack(alignment: .leading, spacing: 10) {
                        Text("Calories Consumed")
                            .font(.system(size: 14))
                            .foregroundColor(Color(hex: Constants.Colors.customGray))

                        Text("568.1 kcal")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color(hex: Constants.Colors.customBlackColor))

                        VStack(spacing: 6) {
                            MacroIndicatorView(name: "Protein", value: "40%", color: Constants.Colors.primaryGreen)
                            MacroIndicatorView(name: "Carbs", value: "35%", color: "#FFA726")
                            MacroIndicatorView(name: "Fats", value: "25%", color: "#6DA0FF")
                        }
                    }
                }

                // Divider Image
                Image("dividerImage")
                    .resizable()
                    .frame(height: 1)
                    .padding(.horizontal, 16)

                // Motivational Text
                Text("Keep going! You’re doing great!")
                    .font(.system(size: 14))
                    .foregroundColor(Color(hex: Constants.Colors.customGray))
                    .padding(.leading, 16)
            }
            .padding(20)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 2)
        }
        .padding(.horizontal, 20)
    }
}




struct PieChartView: UIViewRepresentable {
    let values: [Double]
    let colors: [Color]
    let names: [String]

    func makeUIView(context: Context) -> DGCharts.PieChartView {
        let chartView = DGCharts.PieChartView()
        chartView.usePercentValuesEnabled = true
        chartView.drawEntryLabelsEnabled = false
        chartView.legend.enabled = false
        chartView.holeRadiusPercent = 0.5  // Makes it a donut chart
        chartView.holeColor = UIColor.clear
        chartView.transparentCircleColor = UIColor.clear
        return chartView
    }

    func updateUIView(_ uiView: DGCharts.PieChartView, context: Context) {
        // Generate PieChartDataEntry dynamically from values & names
        let entries: [PieChartDataEntry] = values.enumerated().map { (index, value) in
            PieChartDataEntry(value: value, label: names[index])
        }

        let dataSet = PieChartDataSet(entries: entries, label: "")
        
        // Convert SwiftUI Color to UIColor for DGCharts compatibility
        dataSet.colors = colors.map { UIColor($0) }
        dataSet.valueTextColor = .black
        dataSet.valueFont = .systemFont(ofSize: 12)
        
        let data = PieChartData(dataSet: dataSet)
        data.setValueFormatter(DefaultValueFormatter(formatter: NumberFormatter()))
        
        uiView.data = data
        uiView.notifyDataSetChanged()
    }
}


