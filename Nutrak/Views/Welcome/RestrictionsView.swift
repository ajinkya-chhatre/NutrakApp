//
//  RestrictionsView.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 06/02/25.
//


import SwiftUI

struct RestrictionsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedDietaryPreference: String?
    @State private var selectedAllergy: String?
    @State private var navigateToMainAppContentView = false // State to control navigation
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                // Navigation Bar
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.gray)
                    }
                    .padding(.leading)
                    Spacer()
                }
                .padding(.top, 12)
                
                // Step Progress Image
                Image("stepProgress6")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 328, height: 4)
                
                // Restrictions Image
                Image("restrictionsImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .padding(.top, 56)
                
                // "Any preferences or restrictions?" Text
                Text("Any preferences or restrictions?")
                    .font(.system(size: 20))
                    .foregroundColor(Color(hex: Constants.Colors.customBlackColor))
                    .padding(.top, 20)
                
                // Description Text
                Text("Let’s make sure your nutrition advice fits your lifestyle.")
                    .font(.system(size: 14))
                    .foregroundColor(Color(hex: Constants.Colors.customGray))
                    .padding(.top, 8)
                
                // "Dietary Preferences" Text
                Text("Dietary Preferences")
                    .font(.system(size: 16))
                    .foregroundColor(Color(hex: Constants.Colors.customBlackColor))
                    .padding(.top, 40)
                
                // Dietary Preference Buttons (Vegan and Keto)
                HStack(spacing: 16) {
                    dietaryButton(title: "Vegan", imageName: "veganImage", isSelected: selectedDietaryPreference == "Vegan") {
                        selectedDietaryPreference = "Vegan"
                    }
                    dietaryButton(title: "Keto", imageName: "ketoImage", isSelected: selectedDietaryPreference == "Keto") {
                        selectedDietaryPreference = "Keto"
                    }
                }
                .padding(.top, 16)
                
                // "Allergies" Text
                Text("Allergies")
                    .font(.system(size: 16))
                    .foregroundColor(Color(hex: Constants.Colors.customBlackColor))
                    .padding(.top, 32)
                
                // Allergy Buttons (Gluten-Free and Nut-Free)
                HStack(spacing: 16) {
                    allergyButton(title: "Gluten-Free", imageName: "glutenFreeImage", isSelected: selectedAllergy == "Gluten-Free") {
                        selectedAllergy = "Gluten-Free"
                    }
                    allergyButton(title: "Nut-Free", imageName: "nutFreeImage", isSelected: selectedAllergy == "Nut-Free") {
                        selectedAllergy = "Nut-Free"
                    }
                }
                .padding(.top, 16)
                
                Spacer()
                
                // Finish Setup Button
                .padding(.bottom, 16)

                // Continue Button
                NavigationLink(destination: BaseContentView(), isActive: $navigateToMainAppContentView) {
                    Button(action: {
                        navigateToMainAppContentView = true
                    }) {
                        Text("Finish Setup")
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                            .frame(height: 44)
                            .frame(maxWidth: .infinity)
                            .background(Color(hex: Constants.Colors.vibrantOrange))
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal, 16)
            }
            .padding(.horizontal, 16)
        }
        .navigationBarHidden(true)
    }
    
    private func dietaryButton(title: String, imageName: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(Color(hex: Constants.Colors.customGray))
            }
            .frame(width: 158, height: 90)
            .background(Color.clear) // Keep background clear
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isSelected ? Color(hex: "#FFBF62") : Color.gray, lineWidth: 1) // Change only the border color
            )
        }
    }

    private func allergyButton(title: String, imageName: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(Color(hex: Constants.Colors.customGray))
            }
            .frame(width: 158, height: 90)
            .background(Color.clear) // Keep background clear
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isSelected ? Color(hex: "#FFBF62") : Color.gray, lineWidth: 1) // Change only the border color
            )
        }
    }
}

