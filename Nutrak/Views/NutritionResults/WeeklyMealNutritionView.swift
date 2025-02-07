//
//  WeeklyMealNutritionView.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 07/02/25.
//
import Foundation
import SwiftUI

struct WeeklyMealNutritionView: View {
    let days = ["S", "M", "T", "W", "T", "F", "S"]
    let values: [CGFloat] = [30, 50, 40, 60, 70, 80, 45]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Weekly Meal Nutrition")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(Color(hex: Constants.Colors.customBlackColor))
                .padding(.leading, 16)
                .padding(.top, 12)
                .offset(y: -4) // Moves the title slightly up

            GeometryReader { geo in
                HStack(alignment: .bottom) {
                    ForEach(0..<7, id: \.self) { index in
                        VStack {
                            Rectangle()
                                .fill(LinearGradient(gradient: Gradient(colors: [Color(hex: "#5CA660"), Color(hex: "#E29523")]), startPoint: .top, endPoint: .bottom))
                                .frame(width: 8, height: values[index])
                            
                            Text(days[index])
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                        }
                        .frame(width: (geo.size.width - 40) / 7)
                    }
                }
                .frame(height: 84)
                .padding(.horizontal, 20)
                .offset(y: -8) // Moves the bar chart up
            }
            .frame(height: 76)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 138)
        .background(Color(hex: "#EDEDED"))
        .cornerRadius(10)
        .padding(.horizontal, 20)
    }
}


