//
//  characterData.swift
//  ricky and morty
//
//  Created by V UMESH KUMAR RAJU on 15/07/21.
//

import Foundation

struct characterData: Codable{
    let name:String
    let status:String
    let image: String
    let origin: Origin
    let gender: String
    let location:Location
    
    struct Origin:Codable {
        let name:String
    }
    
    struct Location:Codable {
        let name:String
    }
}
