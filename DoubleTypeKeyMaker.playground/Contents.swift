import UIKit






let rangeStart = 1.0
let rangeEnd = 5.0
let stepSize = 0.0001

var adjustedValues: [Double] = []
var currentValue = rangeStart

func adjustValue(toAvoidOverlap newValue: Double, existingValues: [Double]) -> Double {
    var adjustedValue = newValue
    var tolerance = 0.0001 // 허용 오차
    
    // 기존 값과의 겹침 여부 확인
    for value in existingValues {
        if abs(newValue - value) < tolerance {
            // 겹칠 경우 값 조정
            adjustedValue += 0.00001 // 허용 오차보다 소숫점 자리 수가 더 낮은 값 조정
        }
    }
    
    return adjustedValue
}


while currentValue <= rangeEnd {
    let a = currentValue
    let x = currentValue
    let ln = exp(a)
    let y = pow(a, x)
    // 지수함수 미분
    var yPrime = y * ln
    
    // 겹치는지 확인하고 값 조정
    yPrime = adjustValue(toAvoidOverlap: yPrime, existingValues: adjustedValues)
    
    adjustedValues.append(yPrime)
    
    print(yPrime)
    
    currentValue += stepSize
}

