//
//  GeoComplyNetwork.swift
//  Swinject
//
//  Created by Jacky on 02/03/2023.
//

import Foundation
import GeoComplyCache

public protocol GeoComplyLocation {
    func startGetLocation()
    var cache: GeoComplyCache? { get set }
}

public class GeoComplyLocationClass: GeoComplyLocation {
    public init() {}
    
    public func startGetLocation() {
        print("GeoComplyLocation - startGetLocation")
        cache?.request()
    }
    public var cache: GeoComplyCache?
}
