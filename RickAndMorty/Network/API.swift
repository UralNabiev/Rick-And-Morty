//
//  API.swift
//  RickAndMorty
//
//  Created by O'ral Nabiyev on 09/02/23.
//

import Foundation
import SwiftyJSON
import Alamofire





class API {
    
    //BaseURL
    static let baseUrl:String = "https://rickandmortyapi.com/api"
    
    //URLs

    static let character: String = baseUrl+EndPoints.characterURL
    static let locations: String = baseUrl+EndPoints.locationURL
    static let episodes: String = baseUrl+EndPoints.episodes
    
    static func getCharacter(completion: @escaping([CharacterDM]?)->Void) {
        
        NET.sendRequest(to: character, method: .get, headers: nil, param: nil) { data in
            guard let data = data else {return}
            print("dataToday = ",data)
            let mydata = data["results"].arrayValue.map{CharacterDM(json: $0)}
            completion(mydata)
        }
    }
    
    static func getCharacterInfo(url:String, completion: @escaping (CharacterDM?)->Void) {
        NET.sendRequest(to:url, method: .get, headers: nil, param: nil) { data in
            guard let data = data else { return }
            let myData = CharacterDM(json: data)
            completion(myData)
        }
        
    }
    
    
}

//MARK: - URLs
extension API {
    
    enum EndPoints {
        static let characterURL = "/character"
        static let locationURL = "/location"
        static let episodes = "/episode"
    }
    
}

