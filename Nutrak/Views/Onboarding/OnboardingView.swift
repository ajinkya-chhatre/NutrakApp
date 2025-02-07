//
//  OnboardingView.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 05/02/25.
//


import SwiftUI

struct OnboardingView: View {
    @StateObject private var viewModel = OnboardingViewModel()
    @State private var isOnboardingComplete = false

    var body: some View {
        NavigationStack {
            VStack {
                OnboardingScreen(
                    imageName: viewModel.screens[viewModel.currentIndex].image,
                    title: viewModel.screens[viewModel.currentIndex].title,
                    description: viewModel.screens[viewModel.currentIndex].description,
                    showSkip: viewModel.currentIndex < viewModel.screens.count - 1,
                    showBack: viewModel.currentIndex > 0,
                    currentIndex: viewModel.currentIndex,
                    totalScreens: viewModel.screens.count,
                    onNext: {
                        if viewModel.currentIndex == viewModel.screens.count - 1 {
                            isOnboardingComplete = true
                        } else {
                            viewModel.nextScreen()
                        }
                    },
                    onBack: viewModel.previousScreen,
                    onSkip: viewModel.skipOnboarding
                )
                .navigationDestination(isPresented: $isOnboardingComplete) {
                    LoginView()
                }
            }
        }
    }
}



