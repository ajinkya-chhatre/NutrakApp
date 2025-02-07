//
//  SelectGenderView.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 05/02/25.
//

import SwiftUI

struct SelectGenderView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedGender: String? = nil
    @State private var navigateToHeight = false  // State to trigger navigation

    var body: some View {
        NavigationStack {
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
                Image("stepProgress1")
                    .resizable()
                    .frame(width: 328, height: 4)
                    .padding(.top, 12)

                // Gender Image
                Image("genderImage")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .padding(.top, 36)

                // Question Text
                Text("What is your gender?")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color(hex: Constants.Colors.customBlackColor))
                    .padding(.top, 20)

                // Gender Selection Buttons
                HStack(spacing: 16) {
                    GenderButton(gender: "Male", imageName: "maleImage", isSelected: selectedGender == "Male") {
                        selectedGender = "Male"
                    }
                    
                    GenderButton(gender: "Female", imageName: "femaleImage", isSelected: selectedGender == "Female") {
                        selectedGender = "Female"
                    }
                }
                .padding(.top, 84)

                Spacer()

                // Continue Button with Navigation
                NavigationLink(destination: SelectHeightView(), isActive: $navigateToHeight) {
                    Button(action: {
                        if selectedGender != nil { // Only navigate if a gender is selected
                            navigateToHeight = true
                        }
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
}


// Custom Gender Button Component
struct GenderButton: View {
    let gender: String
    let imageName: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 48, height: 48)

                Text(gender)
                    .font(.system(size: 14))
                    .foregroundColor(Color(hex: isSelected ? "#141414" : "#565656"))
            }
            .frame(width: 158, height: 106)
            .background(isSelected ? Color(hex: Constants.Colors.vibrantOrange).opacity(0.3) : Color.white)
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(isSelected ? Color(hex: Constants.Colors.vibrantOrange) : Color.gray, lineWidth: 1))
        }
    }
}
