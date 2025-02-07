//
//  WelcomeView.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 05/02/25.
//

import SwiftUI

struct WelcomeView: View {
    @State private var navigateToSelectGender = false

    var body: some View {
        VStack {
            Spacer().frame(height: 140)

            // Logo
            Image("mainNutrakLogo")
                .resizable()
                .frame(width: 155, height: 40)

            Spacer().frame(height: 196)

            // Welcome Text
            Text("Welcome to Nutrak!")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color(hex: Constants.Colors.customBlackColor))

            // Description Text
            Text("Hey! I am your personal Nutritionist powered by Flex AI, I will ask you some questions to give you a personalized smart diet plan.")
                .font(.system(size: 14))
                .foregroundColor(Color(hex: Constants.Colors.customGray))
                .multilineTextAlignment(.center)
                .frame(maxWidth: 300)
                .padding(.top, 8)

            Spacer()

            // Continue Button
            NavigationLink(destination: SelectGenderView(), isActive: $navigateToSelectGender) {
                EmptyView()
            }
            .hidden()

            Button(action: {
                navigateToSelectGender = true
            }) {
                Text("Continue")
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .background(Color(hex: Constants.Colors.vibrantOrange))
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
        .navigationBarHidden(true)
    }
}

