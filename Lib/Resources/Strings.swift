//
//  Strings.swift
//  Lib
//
//  Created by Oleksa 'trimm' Korin on 2/24/18.
//  Copyright © 2018 Oleksa 'trimm' Korin. All rights reserved.
//

import Foundation

public enum Strings: String {
    case email
    case password
    
    // MARK: -
    // MARK: Properties
    
    public var value: String {
        return self.rawValue
    }
    
    public var uppercased: String {
        return self.value.uppercased()
    }
}
