//
//  LocationManger.swift
//  ricky and morty
//
//  Created by V UMESH KUMAR RAJU on 15/07/21.
//

import Foundation

struct LocationManger{
    let locationURL = "https://rickandmortyapi.com/api/location/"
    
    func fetch(n:Int){
        let url = "\(locationURL)\(n)"
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

                    if let location = self.parseJSON(LocationData: safeData){
                        location.show()
                    }
                }
            }

            task.resume()
        }
    }
    func parseJSON(LocationData: Data) -> LocationModel?{
        let decoder = JSONDecoder()
        
        do{
            let decodedData = try decoder.decode(locationData.self, from: LocationData)
            let locationModel = LocationModel(name: decodedData.name, type: decodedData.type, dimension: decodedData.dimension, chars: decodedData.residents)
            return locationModel
        }
        catch{
            print(error)
            return nil
        }
    }
}
