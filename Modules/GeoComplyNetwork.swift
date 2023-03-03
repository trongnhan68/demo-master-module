//
//  GeoComplyNetwork.swift
//  Swinject
//
//  Created by Jacky on 02/03/2023.
//

import Foundation
import GeoComplyCache

public protocol GeoComplyNetwork {
    
    func request()
    var cache: GeoComplyCache? { get set }
}

public class GeoComplyNetworkClass: GeoComplyNetwork {
    public init() {}
    public func request() {
        print("Network - Request")
        cache?.request()
    }
    
    public var cache: GeoComplyCache?
}
