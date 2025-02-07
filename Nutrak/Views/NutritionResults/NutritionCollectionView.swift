//
//  Untitled.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 07/02/25.
//

import Foundation
import SwiftUI


struct NutritionCollectionView: View {
    let sections: [(title: String, items: [(image: String, title: String, subtitle: String)])] = [
        ("Nutritional Overview", [("caloriesNutritionImage", "Calories", "320 kcal")]),
        ("Macronutrients", [
            ("proteinsNutritionImage", "Proteins", "13g"),
            ("carbsNutritionImage", "Carbs", "35g"),
            ("fatsNutritionImage", "Fats", "32g")
        ]),
        ("Micronutrients", [
            ("ironNutritionImage", "Iron", "8 mg"),
            ("calciumNutritionImage", "Calcium", "320 mg")
        ])
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(sections, id: \.title) { section in
                Text(section.title)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(Color(hex: Constants.Colors.customBlackColor))
                    .padding(.leading, 20)

                LazyVGrid(columns: [GridItem(.flexible(), spacing: 8), GridItem(.flexible(), spacing: 8)], spacing: 8) {
                    ForEach(section.items, id: \.title) { item in
                        HStack {
                            Image(item.image)
                                .resizable()
                                .frame(width: 32, height: 32)
                                .padding(.leading, 10)

                            VStack(alignment: .leading, spacing: 2) {
                                Text(item.title)
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(hex: Constants.Colors.customBlackColor))
                                
                                Text(item.subtitle)
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(hex: Constants.Colors.customBlackColor))
                            }
                            Spacer()
                        }
                        .frame(width: 154, height: 54)
                        .background(Color(hex: "#F6F6F6"))
                        .cornerRadius(8)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

