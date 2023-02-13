//
//  NET.swift
//  RickAndMorty
//
//  Created by O'ral Nabiyev on 09/02/23.
//

import Foundation
import SwiftyJSON
import Alamofire
class NET {
    
    static func sendRequest(to url:String, method:HTTPMethod, headers: HTTPHeaders? , param:Parameters?, complation: @escaping (JSON?)->Void){
        
        AF.request(url, method: method, parameters: param, encoding: JSONEncoding.default, headers: headers).responseData { response in
            switch response.result {
            case.success(let data):
                let jsonData = JSON(data)
                complation(jsonData)
            case.failure(let error):
                print("error=",error)
            }
        }
    }
    
    static func sendURLRequest(to url:String, method:HTTPMethod, headers: HTTPHeaders? , param:Parameters?, complation: @escaping (JSON?)->Void){
        
        AF.request(url, method: method, parameters: param, encoding: URLEncoding.default, headers: headers).responseData { response in
            switch response.result {
            case.success(let data):
                let jsonData = JSON(data)
                complation(jsonData)
            case.failure(let error):
                print("error=",error)
            }
        }
    }
}
