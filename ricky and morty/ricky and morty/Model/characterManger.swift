//
//  characterManger.swift
//  ricky and morty
//
//  Created by V UMESH KUMAR RAJU on 15/07/21.
//

import Foundation

protocol characterUpdateDelegate {
    func characterUpdate(char : CharacterModel)
}

struct characterManger{
    let charcterURL = "https://rickandmortyapi.com/api/character/"
    var delegate : characterUpdateDelegate?
    
    func fetch(n:Int){
        let url = "\(charcterURL)\(n)"
        performRequest(urlString:url)
    }
    func performRequest(urlString: String){
        if let url = URL(string: urlString)
        {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    print(error!)
                    return
                }
                if let safeData = data{
                    if let character = self.parseJSON(CharacterData: safeData){
                        self.delegate?.characterUpdate(char: character)
                    }
                }
            }
            task.resume()
        }
    }
    func parseJSON(CharacterData: Data) -> CharacterModel?{
        let decoder = JSONDecoder()
        
        do{
            let decodedData = try decoder.decode(characterData.self, from: CharacterData)
            let characterModel = CharacterModel(name: decodedData.name, pic: decodedData.image, origin: decodedData.origin.name, gender: decodedData.gender, LAL: decodedData.location.name,status: decodedData.status)
            return characterModel
        }
        catch{
            print(error)
            return nil
        }
    }
}
