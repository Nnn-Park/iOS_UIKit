//
//  Observable.swift
//  SeSAC5MVVMBasic
//
//  Created by 박재형 on 7/9/24.
//

import Foundation

class Observable<T> {
    
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
    
    func bind(closure: @escaping (T) -> Void) {
//        closure(value)
        self.closure = closure
    }
}
