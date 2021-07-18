//
//  ViewController.swift
//  ricky and morty
//
//  Created by V UMESH KUMAR RAJU on 15/07/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var TableView: UITableView!
    @IBOutlet var SerchField: UITextField!
    @IBOutlet var characterButtonUI: [UIView]!
    var arrChar : [CharacterModel]  = []
    let urlStr = "1,2,3,4,5,6,7,8,9"
    func fetch() {
        let url = "https://rickandmortyapi.com/api/character/\(urlStr)"
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrChar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chcell = TableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as! characterTableViewCell
        chcell.characterLabel.text = arrChar[indexPath.row].name
        chcell.numberLabel.text = "\(indexPath.row+1)"
        let url = URL(string: arrChar[indexPath.row].pic)
        if let data = try? Data(contentsOf: url!){
            chcell.characterImage.image = UIImage(data: data)
        }
        chcell.characterImage.layer.cornerRadius = chcell.characterImage.frame.height/2
        chcell.characterImage.layer.borderWidth = 2
        if arrChar[indexPath.row].status == "Alive"{
            chcell.characterImage.layer.borderColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0).cgColor
        }
        else{
            chcell.characterImage.layer.borderWidth = 2
            chcell.characterImage.layer.borderColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0).cgColor
        }
        
        chcell.characterImage.clipsToBounds = true
        return chcell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 137
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
        TableView.delegate = self
        TableView.dataSource = self
        SerchField.layer.cornerRadius = 8
        SerchField.clipsToBounds = true
        SerchField.backgroundColor = UIColor.gray
        
    }
}
