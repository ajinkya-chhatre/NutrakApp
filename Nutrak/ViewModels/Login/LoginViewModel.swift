//
//  LoginViewModel.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 05/02/25.
//


import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var shouldNavigateToPasswordScreen: Bool = false
    
    func loginWithEmail() {
        if !email.isEmpty {
            shouldNavigateToPasswordScreen = true
        }
    }
    
    func loginWithGoogle() {
        // Implement Google login logic
    }

    func loginWithApple() {
        // Implement Apple login logic
    }
}

