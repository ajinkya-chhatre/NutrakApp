//
//  OnboardingViewModel.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 05/02/25.
//


import SwiftUI

class OnboardingViewModel: ObservableObject {
    @Published var currentIndex = 0
    
    let screens: [(image: String, title: String, description: String)] = [
        ("OnboardingScreen1", "Track Your Nutrition Effortlessly", "Scan meals, get insights, and achieve health goals—eating healthy made simple!"),
        ("OnboardingScreen2", "Quick and Accurate Food Scans", "Snap or upload a meal to get instant nutrition details with our smart AI technology."),
        ("OnboardingScreen3", "Build Healthy Habits with Streaks", "Log meals, earn badges, and track streaks to celebrate your journey to better health!")
    ]
    
    func nextScreen() {
        if currentIndex < screens.count - 1 {
            currentIndex += 1
        }
    }
    
    func previousScreen() {
        if currentIndex > 0 {
            currentIndex -= 1
        }
    }
    
    func skipOnboarding() {
        currentIndex = screens.count - 1 
    }
}

