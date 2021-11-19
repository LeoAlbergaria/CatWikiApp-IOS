//
//  Cat.swift
//  Cat App
//
//  Created by Leonardo Albergaria on 17/11/21.
//

import Foundation

struct Cat: Codable{
    let name: String
    let description: String
    let temperament: String
    let image: Image?
}

struct Image: Codable{
    let url: String?
}
