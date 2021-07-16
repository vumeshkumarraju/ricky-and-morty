//
//  episodeManger.swift
//  ricky and morty
//
//  Created by V UMESH KUMAR RAJU on 15/07/21.
//

import Foundation

struct episodeManger{
    let episodeURL = "https://rickandmortyapi.com/api/episode/"
    
    func fetch(n:Int){
        let url = "\(episodeURL)\(n)"
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

                    if let episode = self.parseJSON(EpisodeData: safeData){
                        episode.show()
                    }
                }
            }

            task.resume()
        }
    }
    func parseJSON(EpisodeData: Data) -> EpisodeModel?{
        let decoder = JSONDecoder()
        
        do{
            let decodedData = try decoder.decode(episodeData.self, from: EpisodeData)
            let episodeModel = EpisodeModel(name: decodedData.name, AliedOn: decodedData.air_date, season: decodedData.episode, chars: decodedData.characters)
            return episodeModel
        }
        catch{
            print(error)
            return nil
        }
    }
}
