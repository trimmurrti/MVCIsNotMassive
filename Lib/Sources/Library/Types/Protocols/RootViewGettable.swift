//
//  RootViewGettable.swift
//  Lib
//
//  Created by Oleksa 'trimm' Korin on 2/24/18.
//  Copyright © 2018 Oleksa 'trimm' Korin. All rights reserved.
//

import UIKit

public protocol RootViewGettable {
    associatedtype RootViewType
    
    var viewIfLoaded: UIView? { get }
    var rootView: RootViewType? { get }
}

public extension RootViewGettable {
    
    public var rootView: RootViewType? {
        return self.viewIfLoaded.flatMap(cast)
    }
}
