//
//  ApiResponse.swift
//  test
//
//  Created by Sait Cihaner on 23.02.2022.
//

import Foundation

// MARK: - Response
struct Response: Codable {
    let coord: Coord?
    let weather: [Weather]?
    let base: String?
    let main: Main?
    let visibility: Int?
    let wind: Wind?
    let clouds: Clouds?
    let dt: Int?
    let sys: Sys?
    let timezone, id: Int?
    let name: String?
    let cod: Int?
}
