//
//  LoginPresentationModel.swift
//  Lib
//
//  Created by Oleksa 'trimm' Korin on 2/24/18.
//  Copyright © 2018 Oleksa 'trimm' Korin. All rights reserved.
//

import Foundation
import Style

public protocol LoginPresentationModel: AnyObject {
    
    var usernamePlaceholder: String? { get }
    var passwordPlaceholder: String? { get }
    
    var username: String? { get }
    var password: String? { get }
    
    var eventHandler: EventHandler<LoginPresentationModel>? { get set }
    
    var style: Style<LoginViewSubviews> { get }
    var layout: Style<LoginViewSubviews> { get }
    
    func textFieldAdapter(textField: UITextField) -> TextFieldAdapter
}

public class LoginPresentationModelImpl: LoginPresentationModel {
    
    // MARK: -
    // MARK: Properties
    
    public let usernamePlaceholder: String? = Strings.email.uppercased
    public let passwordPlaceholder: String? = Strings.password.uppercased
    
    public var username: String? {
        return self.user.email
    }
    
    public var password: String? {
        return self.user.password
    }
    
    public var eventHandler: EventHandler<LoginPresentationModel>?
    
    public let style: Style<LoginViewSubviews> = { _ in }
    public let layout: Style<LoginViewSubviews> = { _ in }
    
    private let user: User
    
    // MARK: -
    // MARK: Init and Deinit
    
    public init(user: User) {
        self.user = user
        
        user.eventHandler = { [weak self] _ in
            self.do { $0.eventHandler?($0) }
        }
    }
    
    // MARK: -
    // MARK: Public
    
    public func textFieldAdapter(textField: UITextField) -> TextFieldAdapter {
        return TextFieldAdapter(textField)
    }
}
