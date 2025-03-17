//
//  FoodData.swift
//  CodingTest
//
//  Created by 志水拓哉 on 2025/03/16.
//

import Foundation

struct FoodData {
    let name: String
    let protein: Nutrient
    let fat: Nutrient
    let carbohydrate: Nutrient
    
    init(name: String, protein: Double, fat: Double, carbohydrate: Double) {
        self.name = name
        self.protein = Nutrient(type: .protein, amount: protein)
        self.fat = Nutrient(type: .fat, amount: fat)
        self.carbohydrate = Nutrient(type: .carbohydrate, amount: carbohydrate)
    }
    
    var totalCalories: Double {
        let sum = protein.calories + fat.calories + carbohydrate.calories
        return sum.rounded(toDecimalPlaces: 1)
    }
}
