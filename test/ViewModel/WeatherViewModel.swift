//
//  WeatherViewModel.swift
//  test
//
//  Created by Sait Cihaner on 23.02.2022.
//

import Foundation

class WeatherViewModel{
    weak var delegate : WeatherApiProtocol?
    
    func getWeatherInformation(latitude:Double,longitude:Double){
        Network.getData(latitude: latitude, longitude: longitude) { [weak self] res in
            self?.delegate?.weatherApi(response: res, errorMessage: nil)
        } errorHandler: { [weak self] err in
            self?.delegate?.weatherApi(response: nil, errorMessage: err)
        }

    }
}
