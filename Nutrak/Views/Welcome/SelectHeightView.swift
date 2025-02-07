//
//  SelectHeightView.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 06/02/25.
//

import SwiftUI

struct SelectHeightView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedUnit: String = "cm" // Default selection
    @State private var navigateToAgeView = false // State to control navigation
    
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
            Image("stepProgress2")
                .resizable()
                .frame(width: 328, height: 4)
                .padding(.top, 12)

            // Height Image
            Image("heightImage")
                .resizable()
                .frame(width: 48, height: 48)
                .padding(.top, 36)

            // Question Text
            Text("What is your height?")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color(hex: Constants.Colors.customBlackColor))
                .padding(.top, 20)

            // Unit Selection Buttons
            HStack(spacing: 0) {
                UnitButton(title: "cm", isSelected: selectedUnit == "cm") {
                    selectedUnit = "cm"
                }
                UnitButton(title: "ft", isSelected: selectedUnit == "ft") {
                    selectedUnit = "ft"
                }
            }
            .padding(.top, 12)

            // User Height Image with Scale
            GeometryReader { geometry in
                HStack {
                    Spacer() // Ensures centering effect
                    
                    ZStack {
                        Image("userHeightImage")
                            .resizable()
                            .frame(width: 280, height: 382)
                            .padding(.top, 22)
                    }
                    .frame(width: geometry.size.width / 2) // Ensures proper centering
                    
                    Image("heightScale")
                        .resizable()
                        .frame(width: 44, height: 458)
                }
            }
            .frame(height: 458) // Match heightScale’s height for consistency


            Spacer()
            
            // Continue Button
            NavigationLink(destination: SelectAgeView(), isActive: $navigateToAgeView) {
                Button(action: {
                    navigateToAgeView = true
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

// Custom Unit Selection Button
struct UnitButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 12))
                .frame(width: 32, height: 24)
                .background(isSelected ? Color(hex: Constants.Colors.vibrantOrange) : Color.white)
                .foregroundColor(Color(hex: isSelected ? "#141414" : "#7B7B7B"))
                .cornerRadius(4)
                .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.gray, lineWidth: 1))
        }
    }
}
