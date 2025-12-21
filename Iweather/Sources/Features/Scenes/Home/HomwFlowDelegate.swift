//
//  HomwFlowDelegate.swift
//  Iweather
//
//  Created by pablo henrique on 14/12/25.
//

public protocol HomeFlowDelegate: AnyObject {
    
    func navigateToWeatherDetails(nameCitty: String, lat: Double, lon: Double)
}
