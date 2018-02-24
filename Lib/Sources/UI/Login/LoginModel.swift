//
//  LoginModel.swift
//  Lib
//
//  Created by Oleksa 'trimm' Korin on 2/24/18.
//  Copyright © 2018 Oleksa 'trimm' Korin. All rights reserved.
//

import Foundation
import Style

public class LoginModel: Model {
    
    // MARK: -
    // MARK: Properties
    
    public var controller: LoginModel {
        return self
    }
    
    public let presentation: LoginPresentationModel
    public let assembly = LoginAssembly()
    
    public var username: String?
    public var password: String?
    
    // MARK: -
    // MARK: Init and Deinit
    
    public init(user: User) {
        self.username = user.email
        self.password = user.password
        
        self.presentation = LoginPresentationModelImpl(user: user)
    }
    
    // MARK: -
    // MARK: Public
    
    public func update(completion: (User, Bool) -> Void) {
        self.username
            .flatMap { username in
                self.password.flatMap {
                    self.assembly.user(username: username, password: $0)
                }
            }
            .do { completion($0, true) }
    }
}
