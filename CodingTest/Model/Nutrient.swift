//
//  Nutrient.swift
//  CodingTest
//
//  Created by 志水拓哉 on 2025/03/16.
//

import Foundation

// 各栄養素
struct Nutrient {
    let type: NutrientType
    let amount: Double
    
    var calories: Double {
        let calories = type.caloriePerGram * roundedAmount
        // カロリー(kcal) を小数第一位で四捨五入する
        return calories.rounded(toDecimalPlaces: 1)
    }
    
    // 摂取gを小数第二位で四捨五入する
    var roundedAmount: Double {
        return amount.rounded(toDecimalPlaces: 2)
    }
}
