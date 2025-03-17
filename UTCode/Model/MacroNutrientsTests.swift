//
//  MacroNutrientsTests.swift
//  CodingTestTests
//
//  Created by 志水拓哉 on 2025/03/16.
//

import XCTest
@testable import CodingTest

// カプセル化の最下層からUTコードを実装していく
// NutrientTypeのテスト
class NutrientTypeTests: XCTestCase {
    
    func testNutrientType() {
        // 三大栄養素の固定値のUTコードを実装する
        XCTAssertEqual(NutrientType.protein.caloriePerGram, 4.0, "タンパク質のカロリー係数えラー")
        XCTAssertEqual(NutrientType.fat.caloriePerGram, 9.0, "脂質のカロリー係数エラー")
        XCTAssertEqual(NutrientType.carbohydrate.caloriePerGram, 4.0, "炭水化物のカロリー係数エラー")
    }
}

// Nutrientのテスト
class NutrientTests: XCTestCase {
    
    func testNutrientCalCalculation() {
        //可変値のUTコードを実装する
        
        let protein = Nutrient(type: .protein, amount: 10.0)
        let fat = Nutrient(type: .fat, amount: 10.0)
        let carb = Nutrient(type: .carbohydrate, amount: 10.0)
        
        // 各三大栄養素の摂取量に対して、それぞれの係数を掛ける
        XCTAssertEqual(protein.calories, 40.0, "タンパク質のカロリー計算エラー")
        XCTAssertEqual(fat.calories, 90.0, "脂質のカロリー計算エラー")
        XCTAssertEqual(carb.calories, 40.0, "炭水化物のカロリー計算エラー")
    }
    
    func testNutrientRound() {
        // Nutrientの丸め処理テストのUTコードを実装する
        let protein1 = Nutrient(type: .protein, amount: 1.54)
        let protein2 = Nutrient(type: .protein, amount: 1.55)
        
        // 摂取量(g)が小数第二位で四捨五入していることを確認する
        XCTAssertEqual(protein1.roundedAmount, 1.5, "栄養素の丸め処理エラー")
        XCTAssertEqual(protein2.roundedAmount, 1.6, "栄養素の丸め処理エラー")
        
        // カロリー(kcal)が小数第一位を四捨五入で四捨五入していることを確認する
        XCTAssertEqual(protein1.calories, 6.0, "丸め処理後のカロリー計算エラー")
        XCTAssertEqual(protein2.calories, 6.0, "丸め処理後のカロリー計算エラー")
    }
}

// FoodDataのテスト
class FoodTests: XCTestCase {
    
    // 食事の総カロリー計算テスト
    func testFoodTotalCalories() {
        let rice = FoodData(name: "白米", protein: 2.5, fat: 0.3, carbohydrate: 37.1) // 161.1 → 161
        let natto = FoodData(name: "納豆", protein: 16.5, fat: 10.0, carbohydrate: 12.1) // 204.4 → 204
        
        XCTAssertEqual(rice.totalCalories, 161, "白米のカロリー計算エラー")
        XCTAssertEqual(natto.totalCalories, 204, "納豆のカロリー計算えらー")
    }
}

// MealDataのテスト
class MealTests: XCTestCase {
    
    // 複数食品の合計カロリー計算テスト
    func testMealTotalCalories() {
        let rice = FoodData(name: "白米", protein: 2.5, fat: 0.3, carbohydrate: 37.1) // 161kcal
        let natto = FoodData(name: "納豆", protein: 16.5, fat: 10.0, carbohydrate: 12.1) // 204kcal
        let nattoRice = MealData(name: "納豆ごはん", foods: [rice, natto])
        
        XCTAssertEqual(nattoRice.totalCalories, 365, "納豆ご飯の合計カロリー計算エラー")
    }
}
