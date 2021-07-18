//
//  CharacterModel.swift
//  ricky and morty
//
//  Created by V UMESH KUMAR RAJU on 15/07/21.
//

import Foundation
class CharacterModel{
    let name : String
    let pic : String
    let origin : String
    let gender: String
    let LAL: String
    let status:String
    
    init(name : String, pic: String,origin :String,gender :String,LAL :String,status :String) {
        self.name = name
        self.pic = pic
        self.origin = origin
        self.status = status
        self.gender = status
        self.LAL = LAL
    }
    func show(){
        print("name :- \(name)")
        print("origin :- \(name)")
        print("gender :- \(gender)")
        print("status:- \(status)")
        print("Last Active Location:- \(LAL)")
    }
}




