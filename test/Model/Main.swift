//
//  Main.swift
//  test
//
//  Created by Sait Cihaner on 23.02.2022.
//

import Foundation

struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, humidity: Int?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike
        case tempMin
        case tempMax
        case pressure, humidity
    }
}
