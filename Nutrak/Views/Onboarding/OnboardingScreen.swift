//
//  OnboardingScreen.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 05/02/25.
//


import SwiftUI

struct OnboardingScreen: View {
    let imageName: String
    let title: String
    let description: String
    let showSkip: Bool
    let showBack: Bool
    let currentIndex: Int
    let totalScreens: Int
    let onNext: () -> Void
    let onBack: () -> Void 
    let onSkip: () -> Void

    var body: some View {
        ZStack {
            // Background Image
            GeometryReader { geometry in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .edgesIgnoringSafeArea(.all)
            }

            VStack {
                // Skip button at the top-right corner
                HStack {
                    Spacer()
                    if showSkip {
                        Button(action: onSkip) {
                            Text("Skip »")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                        }
                        .padding()
                    }
                }
                
                Spacer()
                
                // Content
                VStack(spacing: 12) {
                    Text(title)
                        .font(.custom("Roboto", size: 22))
                        .fontWeight(.bold)
                        .kerning(-0.5)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)

                    Text(description)
                        .font(.custom("Roboto", size: 16))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(hex: Constants.Colors.customGray))
                }
                .padding()

                // Pager Dots
                HStack {
                    ForEach(0..<totalScreens, id: \.self) { index in
                        Circle()
                            .fill(index == currentIndex ? Color.black : Color.gray.opacity(0.3))
                            .frame(width: 8, height: 8)
                    }
                }
                .padding(.bottom, 20)

                // Back and Next Buttons
                HStack {
                    if showBack {
                        Button(action: onBack) {
                            HStack {
                                Image(systemName: "chevron.left")
                                Text("Back")
                            }
                            .font(.custom("Roboto", size: 16))
                            .fontWeight(.bold)
                            .frame(width: 121, height: 44)
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(12)
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.black, lineWidth: 1))
                        }
                    } else {
                        Spacer()
                    }
                    
                    Spacer()
                    
                    Button(action: onNext) {
                        HStack {
                            Text("Next")
                            Image(systemName: "chevron.right")
                        }
                        .font(.custom("Roboto", size: 16))
                        .fontWeight(.bold)
                        .frame(width: 121, height: 44)
                        .background(Color(hex: Constants.Colors.vibrantOrange))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    }
                }
                .padding()
            }
            .padding(.bottom, 30)
        }
    }
}

