//
//  ScanningScreen.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 07/02/25.
//

import Foundation
import UIKit
import SwiftUI
import AVFoundation


struct ScanningScreen: View {
    @Binding var navigateToResults: Bool
    @State private var progress: CGFloat = 0.0
    var delay: Double = 5.0 // 5 seconds delay

    var body: some View {
        VStack {
            Spacer().frame(height: 80)

            Image("homeNutrakLogo")
                .resizable()
                .frame(width: 89, height: 24)
                .scaledToFit()

            Spacer().frame(height: 155)

            ZStack {
                Image("loaderImage")
                    .resizable()
                    .frame(width: 144, height: 144)
                    .rotationEffect(Angle(degrees: progress * 720))
                    .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false), value: progress)
            }

            Spacer().frame(height: 48)

            Text("Scanning in progress...")
                .font(.system(size: 14))
                .foregroundColor(Color(hex: Constants.Colors.customGray))

            Spacer().frame(height: 12)

            ProgressView(value: progress, total: 1.0)
                .progressViewStyle(LinearProgressViewStyle(tint: Color(hex: Constants.Colors.primaryGreen)))
                .frame(height: 6)
                .padding(.horizontal, 28)

            Spacer().frame(height: 14)

            Text("\(Int(progress * 100))%")
                .font(.system(size: 20))
                .foregroundColor(Color(hex: Constants.Colors.customBlackColor))

            Spacer()

            // Hidden NavigationLink inside ScanningScreen
            NavigationLink(destination: NutritionResultsView(navigateBackToHome: .constant(false)),
                           isActive: $navigateToResults) {
                EmptyView()
            }
            .hidden()
        }
        .onAppear {
            startLoading()
        }
        .navigationBarBackButtonHidden(true) // Disable back button
    }

    func startLoading() {
        let interval = delay / 100
        Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { timer in
            withAnimation(.easeInOut(duration: 0.2)) {
                if progress < 1.0 {
                    progress += 0.01
                } else {
                    timer.invalidate()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        navigateToResults = true // This now triggers the NavigationLink in ScanningScreen
                    }
                }
            }
        }
    }
}


