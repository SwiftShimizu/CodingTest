//
//  NutrientType.swift
//  CodingTest
//
//  Created by 志水拓哉 on 2025/03/16.
//

import Foundation

// 三大栄養素
enum NutrientType {
    
    case protein
    case fat
    case carbohydrate
    
    /*
     ● Protein (たんぱく質) : 1(g) = 4(kcal)
     ● Fat (脂質) : 1(g) = 9(kcal)
     ● Carbohydrate (炭水化物) : 1(g) = 4(kcal)
     */
    var caloriePerGram: Double {
        switch self {
        case .protein: return 4.0
        case .fat: return 9.0
        case .carbohydrate: return 4.0
        }
    }
}
