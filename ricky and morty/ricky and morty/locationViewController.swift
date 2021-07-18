//
//  locationViewController.swift
//  ricky and morty
//
//  Created by V UMESH KUMAR RAJU on 17/07/21.
//

import UIKit

class locationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    var lstation = [LocationModel]()
    var ldimension = [LocationModel]()
    var lplanets = [LocationModel]()
    let urlStr = "1,2,3,4,5,6,7"
    func fetch(){
        let url = "https://rickandmortyapi.com/api/location/\(urlStr)"
        var request = URLRequest(url: URL(string: url)!)
        lstation = []
        ldimension = []
        lplanets = []
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
                for eachFetchedLocat in fetchedData{
                    let eachLocat = eachFetchedLocat as! [String : Any]
                    let name = eachLocat["name"] as! String
                    let type = eachLocat["type"] as! String
                    let dimension = eachLocat["dimension"] as! String
                    let chars = eachLocat["residents"] as! [String]
                    
                    if type == "Planet"{
                        self.lplanets.append(LocationModel(name: name, type: type, dimension: dimension, chars: chars))
                    }
                    else if type == "Space station"{
                        self.lstation.append(LocationModel(name: name, type: type, dimension: dimension, chars: chars))
                    }
                    self.ldimension.append(LocationModel(name: name, type: type, dimension: dimension, chars: chars))
                }
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
    @IBOutlet var TableView: UITableView!
    @IBOutlet var serchTextField: UITextField!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ldimension.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let lctcell = TableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath) as! locationTableViewCell
        lctcell.locationName.text = ldimension[indexPath.row].name
        lctcell.locationNumber.text = "\(indexPath.row + 1)"
        return lctcell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 104
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
        TableView.delegate = self
        TableView.dataSource = self
        serchTextField.layer.cornerRadius = 8
        serchTextField.clipsToBounds = true
    }
}
