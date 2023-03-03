//
//  GeoComplyNetwork.swift
//  Swinject
//
//  Created by Jacky on 02/03/2023.
//

import Foundation

public protocol GeoComplyDatabase {
    func request()
}

public class GeoComplyDatabaseClass: GeoComplyDatabase {
    public init() {}
    public func request() {
        print("Database - Request")
    }
}
