//
//  NutritionResults.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 07/02/25.
//

import Foundation
import SwiftUI

struct NutritionResultsView: View {
    @Binding var navigateBackToHome: Bool
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .top) {
                Image("pizzaImage")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 268)
                    .ignoresSafeArea(edges: .top)

                VStack {
                    HStack {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Text("Nutrition Results")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding()
                }
            }

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Image("foodTileImage")
                            .resizable()
                            .frame(width: 40, height: 14)
                        Spacer()
                    }
                    .padding(.leading, 20)

                    Text("Pepperoni Pizza")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color(hex: Constants.Colors.customBlackColor))
                        .padding(.leading, 20)

                    NutritionCollectionView()

                    WeeklyMealNutritionView()

                    Button(action: {
                        // Save to Daily Log action
                    }) {
                        Text("Save to Daily Log")
                            .frame(maxWidth: .infinity)
                            .frame(height: 44)
                            .background(Color(hex: Constants.Colors.vibrantOrange))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal, 20)

                    Text("Want more insights? Upgrade to Premium")
                        .font(.system(size: 14))
                        .foregroundColor(Color(hex: Constants.Colors.customGray))
                        .padding(.top, 12)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
        .navigationBarHidden(true)
    }
}


