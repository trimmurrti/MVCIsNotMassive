//
//  LoginView.swift
//  Lib
//
//  Created by Oleksa 'trimm' Korin on 2/24/18.
//  Copyright © 2018 Oleksa 'trimm' Korin. All rights reserved.
//

import Foundation
import SnapKit
import Style

public protocol LoginPresentationModel {
    
    var usernamePlaceholder: String? { get }
    var passwordPlaceholder: String? { get }
    
    func textFieldAdapter(textField: UITextField) -> TextFieldAdapter
    
    func applyStyle(view: LoginViewImpl)
    func applyLayout(view: LoginViewImpl)
}

public protocol LoginView {
    var eventHandler: EventHandler<LoginViewEvent>? { get }
    
    var isLoading: Bool { get set }
    func setLoading(_ loading: Bool, animated: Bool)
}

public enum LoginViewEvent {
    case username(String?)
    case password(String?)
    case login
    case register
}

public class LoginViewImpl: RootView<LoginPresentationModel>, LoginView, UITextFieldDelegate {
    
    // MARK: -
    // MARK: Properties
    
    public let usernameTextField = UITextField()
    public let passwordTextField = UITextField()
    public let loginButton = UIButton()
    public let registerButton = UIButton()
    
    public var isLoading = false
    public func setLoading(_ loading: Bool, animated: Bool) {
        
    }
    
    private let usernameAdapter: TextFieldAdapter
    private let passwordAdapter: TextFieldAdapter
    
    open override var content: [UIView] {
        return super.content + self.textFields
    }
    
    public var textFields: [UITextField] {
        return [self.usernameTextField, self.passwordTextField]
    }
    
    public var eventHandler: EventHandler<LoginViewEvent>?
    
    // MARK: -
    // MARK: Init and Deinit
    
    public override init(model: LoginPresentationModel) {
        self.usernameAdapter = model.textFieldAdapter(textField: self.usernameTextField)
        self.passwordAdapter = model.textFieldAdapter(textField: self.passwordTextField)
            
        super.init(model: model)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: Open
    
    open override func configureDesign() {
        super.configureDesign()
        
        nonAutocapitalizedFormTextField(self.usernameTextField)
        passwordFormTextField(self.passwordTextField)
    }
    
    public override func configureBindings() {
        super.configureBindings()
        
        self.bindButtons()
        self.bindAdapters()
    }
    
    open override func fill(from model: LoginPresentationModel) {
        super.fill(from: model)
        
        self.usernameTextField.placeholder = model.usernamePlaceholder
        self.passwordTextField.placeholder = model.passwordPlaceholder
        
        model.applyStyle(view: self)
        model.applyLayout(view: self)
    }
    
    // MARK: -
    // MARK: Actions
    
    @objc func didPressButton(sender: UIButton) {
        let handler = self.eventHandler
        
        switch sender {
        case self.loginButton: handler?(.login)
        case self.registerButton: handler?(.register)
        default: break
        }
    }
    
    // MARK: -
    // MARK: Private
    
    private func bindButtons() {
        [self.loginButton, self.registerButton].forEach {
            $0.addTarget(
                self,
                action: #selector(self.didPressButton),
                for: .touchUpInside
            )
        }
    }
    
    private func bindAdapters() {
        weak var weakSelf = self
        
        self.usernameAdapter.eventHandler = self.sendStringEvent(
            factory: LoginViewEvent.username,
            onReturn: { weakSelf?.passwordTextField.becomeFirstResponder() }
        )
        
        self.passwordAdapter.eventHandler = self.sendStringEvent(
            factory: LoginViewEvent.password,
            onReturn: { weakSelf?.passwordTextField.resignFirstResponder() }
        )
    }
    
    private func sendStringEvent(
        factory: @escaping (String?) -> LoginViewEvent,
        onReturn: @escaping () -> Void
    )
        -> (TextFieldEvent) -> Void
    {
        return { [weak self] in
            switch $0 {
            case let .text(string): self?.eventHandler?(factory(string))
            case .returnKey: onReturn()
            }
        }
    }
}
