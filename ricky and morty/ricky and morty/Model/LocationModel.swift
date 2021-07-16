//
//  LocationModel.swift
//  ricky and morty
//
//  Created by V UMESH KUMAR RAJU on 15/07/21.
//

import Foundation

struct LocationModel{
    let name : String
    let type : String
    let dimension: String
    let chars: [String]
    
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