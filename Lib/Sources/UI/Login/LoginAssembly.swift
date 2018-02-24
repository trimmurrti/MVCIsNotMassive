//
//  LoginAssembly.swift
//  Lib
//
//  Created by Oleksa 'trimm' Korin on 2/24/18.
//  Copyright © 2018 Oleksa 'trimm' Korin. All rights reserved.
//

import Foundation

public struct LoginAssembly: Assembly {
    public typealias Model = LoginPresentationModel
    public typealias View = LoginViewImpl
    
    public func view(model: Model) -> View {
        return LoginViewImpl(model: model)
    }
    
    public func user(username: String, password: String) -> Lib.User {
        return User(email: username, password: password)
    }
}

extension LoginAssembly {
    class User: Lib.User {
        var email: String {
            didSet { self.send() }
        }
        
        var password: String {
            didSet { self.send() }
        }
        
        var name: String? {
            didSet { self.send() }
        }
        
        var eventHandler: EventHandler<Lib.User>?
        
        init(email: String, password: String) {
            self.email = email
            self.password = password
        }
        
        private func send() {
            self.eventHandler?(self)
        }
    }
}
