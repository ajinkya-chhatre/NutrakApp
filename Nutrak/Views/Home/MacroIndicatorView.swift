//
//  MacroIndicatorView.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 06/02/25.
//


import SwiftUI

struct MacroIndicatorView: View {
    let name: String
    let value: String
    let color: String

    var body: some View {
        HStack {
            Circle()
                .fill(Color(hex: color))
                .frame(width: 8, height: 8)
            
            Text(name)
                .font(.system(size: 12))
                .foregroundColor(Color(hex: Constants.Colors.customGray))
            
            Spacer()
            
            Text(value)
                .font(.system(size: 12))
                .foregroundColor(Color(hex: Constants.Colors.customGray))
        }
        .padding(.horizontal, 8)
    }
}
