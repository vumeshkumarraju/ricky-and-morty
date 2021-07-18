//
//  EpisodeModel.swift
//  ricky and morty
//
//  Created by V UMESH KUMAR RAJU on 15/07/21.
//

import Foundation

class EpisodeModel{
        let name : String
        let AiredOn : String
        let season: String
        let episode : String
        let chars: [String]

        init(name:String,AiredOn:String,season:String,episode:String,chars:[String]) {
            self.name = name
            self.AiredOn = AiredOn
            self.season = season
            self.episode = episode
            self.chars = chars
        }
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
        print("Alied On :- \(AiredOn)")
        print("episode and season :- \(season)")
        getChar()
    }
}
