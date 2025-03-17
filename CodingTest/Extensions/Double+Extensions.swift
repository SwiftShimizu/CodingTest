//
//  Double+Extensions.swift
//  CodingTest
//
//  Created by 志水拓哉 on 2025/03/16.
//

import Foundation

extension Double {
    /// 指定した桁数で四捨五入するメソッド
    /// - Parameter places: 四捨五入する桁数。1なら小数第一位、2なら小数第二位を四捨五入する。
    /// - Returns: 四捨五入された値
    func rounded(toDecimalPlaces places: Int) -> Double {
        // 四捨五入する桁数に応じて10の累乗値を計算する
        // 例: placesが1の場合は小数第一位を四捨五入するので10^0 = 1.0を、
        // placesが2の場合は小数第二位を四捨五入するので10^1 = 10.0を返却する
        let factor = pow(10.0, Double(places - 1))
        // 元の値に倍率をかけて、その後元のスケールに戻す
        return (self * factor).rounded(.toNearestOrAwayFromZero) / factor
    }
} 