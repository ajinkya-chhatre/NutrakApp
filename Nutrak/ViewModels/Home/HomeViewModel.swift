//
//  HomeViewModel.swift
//  Nutrak
//
//  Created by Chhatre, Ajinkya | RSI on 06/02/25.
//


import Foundation

class HomeViewModel: ObservableObject {
    @Published var foodItems: [FoodItem] = [
        FoodItem(name: "Mexican Pasta", calories: "320 kcal per serving", imageName: "pastaImage", rating: 5, prepTime: "5 min prep"),
        FoodItem(name: "Chicken Sauteed", calories: "250 kcal per serving", imageName: "chickenSauteenImage", rating: 4, prepTime: "7 min prep")
    ]
    
    @Published var macroData = MacroData(protein: 40, carbs: 35, fats: 25)
}
