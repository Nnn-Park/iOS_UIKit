//
//  Observerable.swift
//  Weather
//
//  Created by 박재형 on 7/14/24.
//

import Foundation

class Observerable<T> {
    
    var closure: ((T) -> Void)?
    
    var value: T {
        didSet {
            print("didSet")
            closure?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
        closure(value)
        self.closure = closure
    }
    
}
