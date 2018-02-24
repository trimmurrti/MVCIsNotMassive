//
//  ViewController.swift
//  MVCIsNotMassive
//
//  Created by Oleksa 'trimm' Korin on 2/24/18.
//  Copyright © 2018 Oleksa 'trimm' Korin. All rights reserved.
//

import UIKit

public class ViewController<View, Model, Assembly>: UIViewController, RootViewGettable
    where
    Model: Lib.Model,
    Assembly == Model.Assembly,
    Assembly.Model == Model.Presentation
{
    
    // MARK: -
    // MARK: Subtypes
    
    public typealias RootViewType = Model.Assembly.View

    
    // MARK: -
    // MARK: Properties
    
    public let model: Model
    public var assembly: Model.Assembly {
        return self.model.assembly
    }
    
    // MARK: -
    // MARK: Init and Deinit
    
    public init(model: Model) {
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    // MARK: -
    // MARK: View Lifecycle
    
    open override func loadView() {
        self.view = self.assembly.view(model: self.model.presentation)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configure()
    }
    
    // MARK: -
    // MARK: Open
    
    open func configure() {
        self.rootView.do(self.configureBindings)
        self.configure(model: self.model.controller)
    }
    
    open func configure(model: Model.Controller) {
        
    }
    
    open func configureBindings(view: RootViewType) {
        
    }
}

