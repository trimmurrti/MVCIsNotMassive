//
//  Functions.swift
//  Lib
//
//  Created by Oleksa 'trimm' Korin on 2/24/18.
//  Copyright © 2018 Oleksa 'trimm' Korin. All rights reserved.
//

import Foundation

public func cast<Value, Result>(_ value: Value) -> Result? {
    return value as? Result
}

public func configure<Value>(_ value: Value?, action: (inout Value) -> Void) -> Value? {
    return value.map {
        var result = $0
        action(&result)
        
        return result
    }
}

@discardableResult
public func setup<Value: AnyObject>(_ value: Value?, action: (Value) -> Void) -> Value? {
    return value.map {
        action($0)
        
        return $0
    }
}
