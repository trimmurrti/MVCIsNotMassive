//
//  TextFieldAdapter.swift
//  Lib
//
//  Created by Oleksa 'trimm' Korin on 2/24/18.
//  Copyright © 2018 Oleksa 'trimm' Korin. All rights reserved.
//

import Foundation

public enum TextFieldEvent {
    case text(String?)
    case `returnKey`
}

public class TextFieldAdapter: NSObject {
    
    // MARK: -
    // MARK: Properties
    
    public let textField: UITextField
    public var eventHandler: EventHandler<TextFieldEvent>?
    
    // MARK: -
    // MARK: Init and Deinit
    
    public init(_ textField: UITextField) {
        self.textField = textField
        super.init()
        
        textField.delegate = self
    }
}

extension TextFieldAdapter: UITextFieldDelegate {
    
    @objc public func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    )
        -> Bool
    {
        self.eventHandler?(.text(textField.text))
        
        return true
    }
    
    @objc public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textField.resignFirstResponder()
        
        self.eventHandler?(.returnKey)
        
        return true
    }
}
