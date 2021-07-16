//
//  EpisodeModel.swift
//  ricky and morty
//
//  Created by V UMESH KUMAR RAJU on 15/07/21.
//

import Foundation

struct EpisodeModel{
    let name : String
    let AliedOn : String
    let season: String
    let chars: [String]
    
    func getChar(){
        var i = 0
        while i != chars.count {
            let c = characterManger()
            c.performRequest(urlString: chars[i])
            i += 1
        }
    }
    
    func show(){
        print("name :- \(name)")
        print("Alied On :- \(AliedOn)")
        print("episode and season :- \(season)")
        getChar()
    }
}
