//
//  LoginView.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 05/02/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                // Background Image
                GeometryReader { geometry in
                    Image("loginBackground")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.5)
                        .clipped()
                        .ignoresSafeArea()
                }

                VStack(spacing: 20) {
                    Spacer()

                    // Title
                    Text("Sign In")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(Color(hex: Constants.Colors.customBlackColor))

                    // Description
                    Text("Log in to track your nutrition and achieve your goals!")
                        .font(.system(size: 14))
                        .foregroundColor(Color(hex: Constants.Colors.customGray))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: 300)

                    // Google & Apple Login Buttons
                    HStack(spacing: 16) {
                        socialLoginButton(image: "googleIcon", text: "Google", backgroundColor: .white, textColor: .black, borderColor: .gray) {
                            viewModel.loginWithGoogle()
                        }

                        socialLoginButton(image: "appleIcon", text: "Apple", backgroundColor: .white, textColor: .black, borderColor: .gray) {
                            viewModel.loginWithApple()
                        }
                    }

                    // Email Input Field
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Email")
                            .font(.system(size: 12))
                            .foregroundColor(Color(hex: Constants.Colors.customGray))

                        TextField("Enter your email", text: $viewModel.email)
                            .padding()
                            .frame(height: 44)
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    }

                    // Navigation to Enter Password Screen
                    NavigationLink(destination: EnterPasswordView(email: viewModel.email), isActive: $viewModel.shouldNavigateToPasswordScreen) {
                        EmptyView()
                    }
                    .hidden()

                    // Continue Button
                    Button(action: {
                        viewModel.loginWithEmail()
                    }) {
                        Text("Continue")
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background(Color(hex: Constants.Colors.vibrantOrange))
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }

                    // Sign Up Text
                    HStack {
                        Text("Don’t have an account?")
                            .foregroundColor(Color(hex: Constants.Colors.customGray))
                            .font(.system(size: 14))

                        Button(action: {
                            // Navigate to Sign Up Flow
                        }) {
                            Text("Sign Up")
                                .foregroundColor(Color(hex: Constants.Colors.primaryGreen))
                                .font(.system(size: 14, weight: .bold))
                        }
                    }
                    .padding(.bottom, 40)
                }
                .padding(.horizontal, 20) // Apply horizontal padding to the entire VStack
                .padding(.top, 40) // Optionally, you can adjust top padding if needed
            }
            .navigationBarBackButtonHidden(true) // Removes back button when inside NavigationStack
        }
    }

    // Helper function for social login buttons
    private func socialLoginButton(image: String, text: String, backgroundColor: Color, textColor: Color, borderColor: Color, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Image(image)
                    .resizable()
                    .frame(width: 20, height: 20)
                Text(text)
                    .font(.system(size: 16, weight: .medium))
            }
            .frame(maxWidth: .infinity, minHeight: 44)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(borderColor, lineWidth: 1))
        }
    }
}
