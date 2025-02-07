//
//  SelectGoalView.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 06/02/25.
//


import SwiftUI

struct SelectGoalView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedGoal: String? = nil
    @State private var navigateToRestrictionsScreen = false  // State to trigger navigation
    
    let goals = [
        ("weightLossImage", "Weight Loss"),
        ("maintainWeight", "Maintain Weight"),
        ("gainWeight", "Gain Weight"),
        ("buildMuscle", "Build Muscle")
    ]
    
    var body: some View {
        VStack {
            // Back Button & Progress Indicator
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            
            Image("stepProgress5")
                .resizable()
                .frame(width: 328, height: 4)
                .padding(.top, 12)
            
            // Goal Image
            Image("goalImage")
                .resizable()
                .frame(width: 48, height: 48)
                .padding(.top, 56)
            
            // Title & Description
            Text("What’s your goal?")
                .foregroundColor(Color(hex: Constants.Colors.customBlackColor))
                .font(.system(size: 20, weight: .bold))
                .padding(.top, 20)
            
            Text("Choose your goal to tailor your nutrition insights.")
                .foregroundColor(Color(hex: Constants.Colors.customGray))
                .font(.system(size: 14))
                .padding(.top, 8)
            
            // Goal Selection
            VStack(spacing: 16) {
                ForEach(goals, id: \.1) { goal in
                    HStack {
                        Image(goal.0)
                            .resizable()
                            .frame(width: 20, height: 20)
                        
                        Text(goal.1)
                            .foregroundColor(Color(hex: Constants.Colors.customGray))
                            .font(.system(size: 14))
                        
                        Spacer()
                    }
                    .padding()
                    .frame(height: 44)
                    .frame(maxWidth: .infinity)
                    .background(selectedGoal == goal.1 ? Color(hex: Constants.Colors.pastelOrange) : Color(hex: "#EDEDED"))
                    .cornerRadius(8)
                    .onTapGesture {
                        selectedGoal = goal.1
                    }
                }
            }
            .padding(.top, 48)
            .padding(.horizontal, 16)
            
            Spacer()
            
            // Continue Button with Navigation
            NavigationLink(destination: RestrictionsView(), isActive: $navigateToRestrictionsScreen) {
                Button(action: {
                    navigateToRestrictionsScreen = true
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
        .navigationBarBackButtonHidden(true)
    }
}

