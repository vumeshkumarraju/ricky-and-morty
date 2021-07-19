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
    var temp = [LocationModel]()
    let urlStr = "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108"
    func fetch(){
        let url = "https://rickandmortyapi.com/api/location/\(urlStr)"
        var request = URLRequest(url: URL(string: url)!)
        lstation = []
        ldimension = []
        lplanets = []
        temp = []
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
                    self.temp.append(LocationModel(name: name, type: type, dimension: dimension, chars: chars))
                    self.ldimension = self.temp
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
    
    @IBAction func StationPressed(_ sender: Any) {
        self.ldimension = self.lstation
        self.TableView.reloadData()
    }
    
    @IBAction func dimensionPressed(_ sender: Any) {
        self.ldimension = self.temp
        self.TableView.reloadData()
    }
    
    @IBAction func PlanetsPressed(_ sender: Any) {
        self.ldimension = self.lplanets
        self.TableView.reloadData()
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "locatShow", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? singleLocationViewController{
            destination.model = ldimension[(TableView.indexPathForSelectedRow?.row)!]
        }
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
