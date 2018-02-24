//
//  Model.swift
//  Lib
//
//  Created by Oleksa 'trimm' Korin on 2/24/18.
//  Copyright © 2018 Oleksa 'trimm' Korin. All rights reserved.
//

public protocol Model {
    associatedtype Controller
    associatedtype Presentation
    associatedtype Assembly: Lib.Assembly
    
    var controller: Controller { get }
    var presentation: Presentation { get }
    var assembly: Assembly { get }
}
