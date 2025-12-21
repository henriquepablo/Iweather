//
//  Citys.swift
//  Iweather
//
//  Created by pablo henrique on 13/12/25.
//

import Foundation

struct Coord: Decodable {
    let lon: Double
    let lat: Double
}

struct Sys: Decodable {
    let country: String
}

struct Citys: Decodable {
    let coord: Coord
    let name: String
    let sys: Sys
}
