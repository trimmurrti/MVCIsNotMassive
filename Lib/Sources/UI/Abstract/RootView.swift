//
//  RootView.swift
//  Lib
//
//  Created by Oleksa 'trimm' Korin on 2/24/18.
//  Copyright © 2018 Oleksa 'trimm' Korin. All rights reserved.
//

import Foundation

public typealias EventHandler<Event> = (Event) -> ()

public class RootView<Model>: UIView {
    
    // MARK: -
    // MARK: Properties
    
    public let model: Model
    
    open var content: [UIView] {
        return []
    }
    
    // MARK: -
    // MARK: Init and Deinit
    
    public init(model: Model) {
        self.model = model
        
        super.init(frame: .zero)
        
        self.configure()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    public override init(frame: CGRect) {
        fatalError()
    }
    
    // MARK: -
    // MARK: Open
    
    open func configure() {
        self.configureSubviewRelations()
        
        self.configureDesign()
        self.configureBindings()
        self.configureLayout()
        
        self.fill(from: self.model)
    }
    
    open func configureBindings() {
        
    }
    
    open func configureSubviewRelations() {
        self.content.forEach(self.addSubview)
    }
    
    open func configureDesign() {
        
    }
    
    open func configureLayout() {
        
    }
    
    open func fill(from model: Model) {
        
    }
}
