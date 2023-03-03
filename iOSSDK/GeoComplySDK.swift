//
//  GeoComply.swift
//  GeoComplySDK
//
//  Created by Jacky on 02/03/2023.
//

import Foundation
import GeoComplyMaster

public class GeoComplySDK {
    
    public required init() {
        geolocate()
    }
    
    public func geolocate() {
        GeoComplyMaster.instance.network?.request()
        GeoComplyMaster.instance.locationService?.startGetLocation()
    }
}
