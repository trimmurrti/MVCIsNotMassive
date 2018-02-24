//
//  LoginViewController.swift
//  Lib
//
//  Created by Oleksa 'trimm' Korin on 2/24/18.
//  Copyright © 2018 Oleksa 'trimm' Korin. All rights reserved.
//

import Foundation

public enum LoginViewControllerEvent {
    case didLogin(User)
    case didRequestRegister
}

public class LoginViewController: ViewController<LoginView, LoginModel, LoginAssembly> {
    
    // MARK: -
    // MARK: Properties
    
    var eventHandler: EventHandler<LoginViewControllerEvent>?
    
    // MARK: -
    // MARK: Open
    
    public override func configureBindings(view: LoginViewImpl) {
        super.configureBindings(view: view)
        
        view.eventHandler = { [weak self] in
            let model = self?.model
            
            switch $0 {
            case let .username(string): model?.username = string
            case let .password(string): model?.password = string
            case .login: self?.login()
            case .register: break
            }
        }
    }
    
    public func login() {
        let setLoading: (Bool) -> Void = {
            self.rootView?.setLoading($0, animated: true)
        }
        
        setLoading(true)
        self.model.update { user, success in
            setLoading(false)
            
            self.eventHandler?(.didLogin(user))
            if !success {
                self.presentError()
            }
        }
    }
    
    public func presentError() {
        
    }
}
