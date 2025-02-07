//
//  HealthTipView.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 06/02/25.
//


import SwiftUI

struct HealthTipView: View {
    var body: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Health Tip of the Day")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color(hex: Constants.Colors.customBlackColor))

                Text("Drinking water before meals can help you stay hydrated and eat just the right amount!")
                    .font(.system(size: 12))
                    .foregroundColor(Color(hex: Constants.Colors.customGray))
            }
            
            Spacer()
            
            Image("glassOfWaterImage")
                .resizable()
                .frame(width: 44, height: 54)
        }
        .padding(.horizontal, 16)
        .frame(height: 104)
        .background(Color(hex: "#C2E4C4"))
        .cornerRadius(12)
        .padding(.horizontal, 20)
    }
}
