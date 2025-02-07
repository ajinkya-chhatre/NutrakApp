//
//  RecommendedItemView.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 06/02/25.
//


import SwiftUI

struct RecommendedItemView: View {
    let item: FoodItem
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(item.imageName)
                .resizable()
                .frame(width: 192, height: 108)
                .cornerRadius(8)
            
            Text(item.name)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(Color(hex: Constants.Colors.customBlackColor))
                .padding([.top, .leading, .trailing], 12)
            
            Text(item.calories)
                .font(.system(size: 12))
                .foregroundColor(Color(hex: "#7B7B7B"))
                .padding(.horizontal, 12)
            
            HStack(spacing: 2) {
                ForEach(0..<item.rating, id: \.self) { _ in
                    Image("starImage")
                        .resizable()
                        .frame(width: 16, height: 16)
                }
            }
            .padding(.horizontal, 12)
            
            Text(item.prepTime)
                .font(.system(size: 12))
                .foregroundColor(Color(hex: "#7B7B7B"))
                .padding([.horizontal, .bottom], 12)
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}
