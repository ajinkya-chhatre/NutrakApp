//
//  SplashView.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 05/02/25.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            OnboardingView()
        } else {
            ZStack {
                Image("SplashScreen")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}
