//
//  ViewModel.swift
//  BMICalculator
//
//  Created by 박재형 on 7/10/24.
//

import Foundation

final class ViewModel {
    
    var inputWeight: Observable<Int?> = Observable(0)
    var inputHeight: Observable<Int?> = Observable(0)
    
    var outputBMIResult: Observable<Double> = Observable(0)
    
    init() {
        print("ViewModel Init")
        inputWeight.bind { _ in
            self.calculateBMI()
        }
        inputHeight.bind { _ in
            self.calculateBMI()
        }
    }
    
    private func calculateBMI() {
        
        guard let weight = inputWeight.value,
              let height = inputHeight.value else { return }
        
        let heightInMeters = Double(height) / 100.0
        let bmiResult = Double(weight) / (heightInMeters * heightInMeters)
        outputBMIResult.value = bmiResult
        print("VM == \(bmiResult)")
    }
    
}

//func calculateBMI(_ height: Int, _ weight: Int) -> Double {
//    let heightInMeters = Double(height) / 100.0
//    let bmiResult = Double(weight) / (heightInMeters * heightInMeters)
//    print(bmiResult)
//    UserDefaults.standard.set(bmiResult, forKey: "BMIResult")
//    return bmiResult
//}
