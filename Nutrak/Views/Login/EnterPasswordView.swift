//
//  EnterPasswordView.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 05/02/25.
//


import SwiftUI

struct EnterPasswordView: View {
    @StateObject private var viewModel: EnterPasswordViewModel
    @Environment(\.presentationMode) var presentationMode

    init(email: String) {
        _viewModel = StateObject(wrappedValue: EnterPasswordViewModel(email: email))
    }

    var body: some View {
        NavigationStack {
            VStack {
                // Navigation Bar
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.gray)
                            .font(.system(size: 20, weight: .medium))
                    }

                    Spacer()

                    Image("nutrakLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)

                    Spacer()

                    Image(systemName: "chevron.left")
                        .opacity(0) // Placeholder for spacing
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)

                Spacer().frame(height: 150)

                // User Details View
                VStack(spacing: 10) {
                    Image("userImage")
                        .resizable()
                        .frame(width: 80, height: 80)

                    Text("Welcome Back")
                        .font(.system(size: 12))
                        .foregroundColor(Color(hex: "#7B7B7B"))

                    Text("Esther Howard")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color(hex: Constants.Colors.customBlackColor))

                    Text(viewModel.email)
                        .font(.system(size: 14))
                        .foregroundColor(Color(hex: Constants.Colors.customGray))
                }

                Spacer().frame(height: 30)

                // Password View
                VStack(alignment: .leading, spacing: 5) {
                    Text("Password")
                        .font(.system(size: 12))
                        .foregroundColor(Color(hex: Constants.Colors.customGray))

                    SecureField("Enter password", text: $viewModel.password)
                        .padding()
                        .frame(height: 44)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))

                    Button(action: {
                        viewModel.forgotPassword()
                    }) {
                        Text("Forgot password?")
                            .font(.system(size: 12))
                            .foregroundColor(Color(hex: "#427DF4"))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
                .padding(.horizontal, 32)

                Spacer()

                // Sign In View
                VStack(spacing: 10) {
                    NavigationLink(destination: WelcomeView(), isActive: $viewModel.shouldNavigateToWelcomeScreen) {
                        EmptyView()
                    }
                    .hidden()

                    Button(action: {
                        viewModel.signIn()
                    }) {
                        Text("Sign In")
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background(Color(hex: Constants.Colors.vibrantOrange))
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 32)

                    HStack {
                        Text("Don’t have an account?")
                            .font(.system(size: 14))
                            .foregroundColor(Color(hex: Constants.Colors.customGray))

                        Button(action: {
                            viewModel.signUp()
                        }) {
                            Text("Sign Up")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(Color(hex: Constants.Colors.primaryGreen))
                        }
                    }
                }
                .padding(.bottom, 40)
            }
            .navigationBarHidden(true)
        }
    }
}

