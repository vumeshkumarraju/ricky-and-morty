//
//  singleEpisodeViewController.swift
//  ricky and morty
//
//  Created by V UMESH KUMAR RAJU on 19/07/21.
//

import UIKit

class singleEpisodeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet var seasonImage: UIImageView!
    @IBOutlet var seasonName: UILabel!
    @IBOutlet var SeasonTitle: UILabel!
    @IBOutlet var airedOn: UILabel!
    @IBOutlet var episodeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
        seasonName.text = "Season \(model.season),Episode \(model.episode)"
        SeasonTitle.text = model.name
        airedOn.text = model.AiredOn
        seasonImage.image = SeasonPoster[(Int(model.season) ?? 1)-1]
        episodeCollectionView.delegate = self
        episodeCollectionView.dataSource = self
        
    }
    var model = EpisodeModel(name: "", AiredOn: "", season: "", episode: "", chars: [])
    let SeasonPoster = [#imageLiteral(resourceName: "season1"),#imageLiteral(resourceName: "season2"),#imageLiteral(resourceName: "season3"),#imageLiteral(resourceName: "season4")]
    var arrChar : [CharacterModel]  = []
    func fetch(){
        var url = ""
        for j in model.chars{
            url = "\(url),\(String(Array(j)[42...]))"
        }
        url = "\("https://rickandmortyapi.com/api/character/")\(String(Array(url)[1...]))"
        print(url)
        var request = URLRequest(url: URL(string: url)!)
        arrChar = []
        request.httpMethod = "GET"
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config,delegate: nil,delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { ( data, response, error ) in
                if error != nil{
                    print("error")
                }
                else{
                    do {
                        let fetchedData = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSArray
                        for eachFetchedChar in fetchedData{
                            let eachChar = eachFetchedChar as! [String : Any]
                            let name = eachChar["name"] as! String
                            let pic = eachChar["image"] as! String
                            let origin = eachChar["origin"] as! [String:String]
                            let gender = eachChar["gender"] as! String
                            let LAL = eachChar["location"] as! [String:String]
                            let status = eachChar["status"] as! String
                            self.arrChar.append(CharacterModel(name: name, pic: pic, origin: origin["name"] ?? "name", gender: gender, LAL: LAL["name"] ?? "name",  status: status))
                        }
                        self.episodeCollectionView.reloadData()
                    }
                    catch
                    {
                        print("error")
                    }
                }
            }
        task.resume()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrChar.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = episodeCollectionView.dequeueReusableCell(withReuseIdentifier: "singleEpi", for: indexPath) as! singleEpisodeCollectionViewCell
        cell.charName.text = arrChar[indexPath.row].name
        cell.imageUrl = arrChar[indexPath.row].name
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 138, height: 147)
    }
    
}
