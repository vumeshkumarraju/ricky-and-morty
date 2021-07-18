//
//  LocationModel.swift
//  ricky and morty
//
//  Created by V UMESH KUMAR RAJU on 15/07/21.
//

import Foundation

class LocationModel{
    let name : String
    let type : String
    let dimension: String
    let chars: [String]
    
    init(name: String,type :String,dimension:String,chars:[String]) {
        self.name = name
        self.type = type
        self.dimension = dimension
        self.chars = chars
    }
    
    func getChar(){
        print("Residents : -")
        var i = 0
        while i != chars.count {
            let c = characterManger()
            c.performRequest(urlString: chars[i])
            i += 1
        }
    }
    
    func show(){
        print("name :- \(name)")
        print("type :- \(type)")
        print("dimension :- \(dimension)")
        getChar()
    }
}
