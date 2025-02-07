//
//  EnterPasswordViewModel.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 05/02/25.
//

import SwiftUI

class EnterPasswordViewModel: ObservableObject {
    @Published var email: String
    @Published var password: String = ""
    @Published var shouldNavigateToWelcomeScreen: Bool = false

    init(email: String) {
        self.email = email
    }

    func signIn() {
        if !password.isEmpty {
            shouldNavigateToWelcomeScreen = true
        }
    }

    func forgotPassword() {
        // Implement forgot password flow
    }

    func signUp() {
        // Implement sign-up navigation
    }
}
