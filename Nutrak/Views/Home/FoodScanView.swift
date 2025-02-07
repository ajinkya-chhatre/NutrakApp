//
//  FoodScanView.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 06/02/25.
//


import SwiftUI

struct FoodScanView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Scan Your Food")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color(hex: Constants.Colors.customBlackColor))
                
                Text("Instantly analyze your meal’s nutrition by scanning it.")
                    .font(.system(size: 12))
                    .foregroundColor(Color(hex: Constants.Colors.customGray))
            }
            
            Spacer()
            
            Image("scanImage")
                .resizable()
                .frame(width: 40, height: 40)
        }
        .frame(maxWidth: .infinity, minHeight: 80) // Ensures HStack takes full width
        .padding(.horizontal, 16)
        .background(Color(hex: "#C2E4C4"))
        .cornerRadius(12)
        .padding(.horizontal, 20)
    }
}

