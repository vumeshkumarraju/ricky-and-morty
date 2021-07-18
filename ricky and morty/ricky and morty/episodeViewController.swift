//
//  episodeViewController.swift
//  ricky and morty
//
//  Created by V UMESH KUMAR RAJU on 17/07/21.
//

import UIKit

class episodeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet var TableView: UITableView!
    
    let SeasonName = ["Season 1","Season 2","Season 3","Season 4"]
    let SeasonPoster = [#imageLiteral(resourceName: "season1"),#imageLiteral(resourceName: "season2"),#imageLiteral(resourceName: "season3"),#imageLiteral(resourceName: "season4")]
    var e = [EpisodeModel]()
    var e1 = [EpisodeModel]()
    var e2 = [EpisodeModel]()
    var e3 = [EpisodeModel]()
    var e4 = [EpisodeModel]()
    var arrE = [[EpisodeModel]()]
    let urlStr = "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41"
    func fetch() {
        let url = "https://rickandmortyapi.com/api/episode/\(urlStr)"
        var request = URLRequest(url: URL(string: url)!)
        e = []
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
                for eachFetchedEps in fetchedData{
                    let eachEps = eachFetchedEps as! [String : Any]
                    let name = eachEps["name"] as! String
                    let AiredOn = eachEps["air_date"] as! String
                    let Season = eachEps["episode"] as! String
                    let chars = eachEps["characters"] as! [String]

                    self.e.append(EpisodeModel(name: name, AiredOn: AiredOn, season: "\(Array(Season)[2])", episode: "\(Array(Season)[5])", chars: chars))
                    if "\(Array(Season)[2])" == "1"{
                        self.e1.append(EpisodeModel(name: name, AiredOn: AiredOn, season: "\(Array(Season)[2])", episode: "\(Array(Season)[5])", chars: chars))
                    }
                    else if "\(Array(Season)[2])" == "2"{
                        self.e2.append(EpisodeModel(name: name, AiredOn: AiredOn, season: "\(Array(Season)[2])", episode: "\(Array(Season)[5])", chars: chars))
                    }
                    else if "\(Array(Season)[2])" == "3"{
                        self.e3.append(EpisodeModel(name: name, AiredOn: AiredOn, season: "\(Array(Season)[2])", episode: "\(Array(Season)[5])", chars: chars))
                    }
                    else if "\(Array(Season)[2])" == "4"{
                        self.e4.append(EpisodeModel(name: name, AiredOn: AiredOn, season: "\(Array(Season)[2])", episode: "\(Array(Season)[5])", chars: chars))
                    }
                }
                self.arrE = [self.e1,self.e2,self.e3,self.e4]
                print(self.arrE.count)
                self.TableView.reloadData()
            }
            catch
            {
                print("error")
            }
        }
    }
    task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
        TableView.delegate = self
        TableView.dataSource = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrE.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as! episodeTableViewCell
        cell.image = SeasonPoster[indexPath.row]
        cell.SeasonName.text = SeasonName[indexPath.row]
        cell.configure(with: arrE[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 293
    }

}
