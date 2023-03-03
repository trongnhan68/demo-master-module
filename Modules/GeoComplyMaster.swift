//
//  File.swift
//  GeoComplyMaster
//
//  Created by Jacky on 02/03/2023.
//

import Foundation
import Swinject

import GeoComplyNetwork
import GeoComplyCache
import GeoComplyDatabase
import GeoComplyLocation

public protocol GeoComplyMasterProtocol {
    var locationService : GeoComplyLocation? { get }
    var network : GeoComplyNetwork? { get }
}

public class GeoComplyMaster: GeoComplyMasterProtocol {
    public static let instance = GeoComplyMaster()
    let container = Container()
    init() {
        container.register(GeoComplyLocation.self) { _ in
            GeoComplyLocationClass()
        }.initCompleted { r, network in
            let child = network as! GeoComplyLocationClass
            child.cache = r.resolve(GeoComplyCache.self)
        }
        
        container.register(GeoComplyDatabase.self) { _ in
            GeoComplyDatabaseClass()
        }
        
        container.register(GeoComplyCache.self) { _ in
            GeoComplyCacheClass()
        }.inObjectScope(.container)
            .initCompleted { r, cache in
                let cache = cache as! GeoComplyCacheClass
                cache.database = r.resolve(GeoComplyDatabase.self)
            }
        
        container.register(GeoComplyNetwork.self) { _ in
            GeoComplyNetworkClass()
        }
        .initCompleted { r, network in
            let child = network as! GeoComplyNetworkClass
            child.cache = r.resolve(GeoComplyCache.self)
        }
    }
    
    public var locationService: GeoComplyLocation? {
        let location = container.resolve(GeoComplyLocation.self)
        return location
    }
    
    public var network: GeoComplyNetwork? {
        let network = container.resolve(GeoComplyNetwork.self)
        return network
    }
}
