//
//  Observerable.swift
//  Weather
//
//  Created by 박재형 on 7/14/24.
//

import Foundation

class Observerable<T> {
    
    var closure: (() -> Void)?
    
    var value: String {
        didSet {
            print("didSet")
            closure?()
        }
    }
    
    init(_ value: String) {
        self.value = value
    }
    
    func bind(value: @escaping () -> Void) {
        value()
        closure = value
    }
    
}
