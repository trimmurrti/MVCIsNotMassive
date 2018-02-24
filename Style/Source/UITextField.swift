//
//  UITextField.swift
//  Style
//
//  Created by Oleksa 'trimm' Korin on 2/24/18.
//  Copyright © 2018 Oleksa 'trimm' Korin. All rights reserved.
//

import UIKit

precedencegroup Composition {
    associativity: left
}

infix operator •: Composition

public typealias Style<Type> = (Type) -> Void
public func • <Type: UIView>(lhs: @escaping Style<Type>, rhs: @escaping Style<Type>) -> Style<Type> {
    return { value in
        [lhs, rhs].forEach { $0(value) }
    }
}

public func font(_ font: UIFont) -> (UITextField) -> () {
    return { $0.font = font }
}

public func textColor(_ color: UIColor) -> (UITextField) -> () {
    return { $0.textColor = color }
}

public func isSecureTextEntry(_ secure: Bool) -> (UITextField) -> () {
    return { $0.isSecureTextEntry = secure }
}

public func returnKeyType(_ type: UIReturnKeyType) -> (UITextField) -> () {
    return { $0.returnKeyType = type }
}

public func autocapitalizationType(_ type: UITextAutocapitalizationType) -> (UITextField) -> () {
    return { $0.autocapitalizationType = type }
}

public let returnKeyNext = returnKeyType(.next)
public let largeFont = font(UIFont.systemFont(ofSize: 18))
public let darkGrayTextColor = textColor(UIColor.darkGray)
public let nonAutocapitalized = autocapitalizationType(.none)

public let textField = largeFont • darkGrayTextColor
public let nonAutocapitalizedFormTextField = textField • nonAutocapitalized
public let passwordFormTextField = textField • returnKeyType(.done) • isSecureTextEntry(true)

