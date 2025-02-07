//
//  FoodItem.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 06/02/25.
//

import Foundation

struct FoodItem: Identifiable {
    let id = UUID()
    let name: String
    let calories: String
    let imageName: String
    let rating: Int
    let prepTime: String
}
