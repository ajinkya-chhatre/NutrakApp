//
//  DiscoverHealthyView.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 06/02/25.
//


import SwiftUI

struct DiscoverHealthyView: View {
    var body: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Discover Healthy Recipes")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color(hex: Constants.Colors.customBlackColor))
                
                Text("Find meals that fit your nutrition goals.")
                    .font(.system(size: 12))
                    .foregroundColor(Color(hex: Constants.Colors.customGray))
            }
            
            Spacer()
            
            Image("burgerImage")
                .resizable()
                .frame(width: 40, height: 40)
        }
        .padding(.horizontal, 16)
        .frame(height: 80)
        .background(Color(hex: Constants.Colors.pastelOrange))
        .cornerRadius(12)
        .padding(.horizontal, 20)
    }
}

