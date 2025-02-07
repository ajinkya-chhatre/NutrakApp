//
//  SelectAgeView.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 06/02/25.
//


import SwiftUI

struct SelectAgeView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedAge: Int = 25 // Default selected age
    @State private var navigateToWeightView = false // State to control navigation
    
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
            Image("stepProgress3")
                .resizable()
                .frame(width: 328, height: 4)
                .padding(.top, 12)

            // Age Image
            Image("ageImage")
                .resizable()
                .frame(width: 48, height: 48)
                .padding(.top, 56)

            // Question Text
            Text("What is your age?")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color(hex: Constants.Colors.customBlackColor))
                .padding(.top, 20)

            // Age Picker
            Picker(selection: $selectedAge, label: Text("")) {
                ForEach(18...80, id: \.self) { age in
                    Text("\(age)").tag(age)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 168, height: 228)
            .padding(.top, 12)

            Spacer()

            // Continue Button
            NavigationLink(destination: SelectWeightView(), isActive: $navigateToWeightView) {
                Button(action: {
                    navigateToWeightView = true
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
