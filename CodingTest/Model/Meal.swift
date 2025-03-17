//
//  Meal.swift
//  CodingTest
//
//  Created by 志水拓哉 on 2025/03/16.
//

import Foundation

// 複数の食事の場合、適当な変数名思いつかず
struct MealData {
    let name: String
    let foods: [FoodData]
    
    var totalCalories: Double {
        // 初期値0から、合計のカロリー数を算出する
        return foods.reduce(0) { (currentTotal, food) in
            return currentTotal + food.totalCalories
        }
    }
}
