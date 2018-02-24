//
//  User.swift
//  Lib
//
//  Created by Oleksa 'trimm' Korin on 2/24/18.
//  Copyright © 2018 Oleksa 'trimm' Korin. All rights reserved.
//

import Foundation

public protocol User: AnyObject {
    var email: String { get }
    var password: String { get }
    var name: String? { get }
    
    var eventHandler: EventHandler<User>? { get set }
}
