//
//  SelectWeightView.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 06/02/25.
//


import SwiftUI

struct SelectWeightView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isKgSelected: Bool = true // Default to kg
    @State private var navigateToGoalView = false // State to control navigation

    var body: some View {
        VStack {
            // Navigation Bar with Back Button
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.gray)
                        .font(.system(size: 20, weight: .medium))
                }
                Spacer()
            }
            .padding(.leading, 16)
            .padding(.top, 16)

            // Step Progress Image
            Image("stepProgress4")
                .resizable()
                .frame(width: 328, height: 4)
                .padding(.top, 12)

            // Weight Image
            Image("weightImage")
                .resizable()
                .frame(width: 48, height: 48)
                .padding(.top, 56)

            // Question Text
            Text("What is your weight?")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color(hex: Constants.Colors.customBlackColor))
                .padding(.top, 20)

            // Unit Toggle Buttons
            HStack(spacing: 0) {
                UnitButton(title: "kg", isSelected: isKgSelected) {
                    isKgSelected = true
                }
                UnitButton(title: "lbs", isSelected: !isKgSelected) {
                    isKgSelected = false
                }
            }

            // Weight Person Image
            Image("weightPersonImage")
                .resizable()
                .frame(width: 62, height: 200)
                .padding(.top, 34)

            // Weight Slider Image
            Image("weightSlider")
                .resizable()
                .frame(maxWidth: .infinity, minHeight: 98)
                .padding(.top, 60)

            Spacer()

            // Continue Button
            NavigationLink(destination: SelectGoalView(), isActive: $navigateToGoalView) {
                Button(action: {
                    navigateToGoalView = true
                }) {
                    Text("Continue")
                        .frame(maxWidth: .infinity, minHeight: 44)
                        .background(Color(hex: Constants.Colors.vibrantOrange))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
        .navigationBarHidden(true)
    }
}


