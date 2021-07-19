//
//  singleLocationViewController.swift
//  ricky and morty
//
//  Created by V UMESH KUMAR RAJU on 19/07/21.
//

import UIKit

class singleLocationViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var locationName: UILabel!
    @IBOutlet var locationType: UILabel!
    @IBOutlet var locationCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationCollectionView.delegate = self
        locationCollectionView.dataSource = self
        locationName.text = model.name
        locationType.text = model.type
        fetch()
        // Do any additional setup after loading the view.
    }
    var model = LocationModel(name: "", type: "", dimension: "", chars: [])
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
                        self.locationCollectionView.reloadData()
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
        let cell = locationCollectionView.dequeueReusableCell(withReuseIdentifier: "singleLocat", for: indexPath) as! singleLocationCollectionViewCell
        cell.charName.text = arrChar[indexPath.row].name
        cell.imageUrl = arrChar[indexPath.row].pic
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 138, height: 147)
    }
}
