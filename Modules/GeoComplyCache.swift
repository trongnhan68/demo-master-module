//
//  GeoComplyNetwork.swift
//  Swinject
//
//  Created by Jacky on 02/03/2023.
//

import Foundation
import GeoComplyDatabase

public protocol GeoComplyCache {
    func request()
    var database: GeoComplyDatabase? { get set }
}

public class GeoComplyCacheClass: GeoComplyCache {
    public init() {}
    public func request() {
        print("Cache - Request")
        database?.request()
    }
    
    public var database: GeoComplyDatabase?
}
