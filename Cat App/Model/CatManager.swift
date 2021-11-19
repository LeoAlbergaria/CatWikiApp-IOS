//
//  CatManager.swift
//  Cat App
//
//  Created by Leonardo Albergaria on 17/11/21.
//

import Foundation
import Alamofire

protocol CatManagerDelegate {
    func didUpdateBreeds(_ catManager: CatManager, breeds: [Cat])
    func didFailWithError(error: Error)
}

struct CatManager {
    
    let url = "https://api.thecatapi.com/v1/breeds?api_key=c0f41c38-f785-480d-9c66-ae2359cbaea3"
    
    var delegate: CatManagerDelegate?
    
    func performRequest(){
        AF.request(url, method: .get).responseDecodable(of: [Cat].self) { response in
            switch response.result {
            case .success(let breeds):
                self.delegate?.didUpdateBreeds(self, breeds: breeds)
            case .failure(let error):
                delegate?.didFailWithError(error: error)
            }
        }
    }
}
