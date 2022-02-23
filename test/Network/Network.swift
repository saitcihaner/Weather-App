//
//  Network.swift
//  test
//
//  Created by Sait Cihaner on 23.02.2022.
//

import Foundation
import Alamofire

class Network{
    static func getData(latitude:Double,longitude:Double,completionHandler:@escaping (Response)->(),errorHandler:@escaping (String)->()){
        let parameters : [String:String] = [
            "lat":"\(latitude)",
            "lon":"\(longitude)",
            "appid" : "YOUR_APİ_KEY"
        ]
        AF.request("https://api.opehnweathermap.org/data/2.5/weather", method: .get, parameters: parameters).responseDecodable { (res:AFDataResponse<Response>) in
            switch res.result{
            case .success(let res):
                completionHandler(res)
                break
            case .failure(let err):
                errorHandler(err.localizedDescription)
                break
            }
        }
    }
}
