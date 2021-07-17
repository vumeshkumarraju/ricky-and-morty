//
//  ViewController.swift
//  ricky and morty
//
//  Created by V UMESH KUMAR RAJU on 15/07/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,characterUpdateDelegate {
    
    @IBOutlet var TableView: UITableView!
    @IBOutlet var SerchField: UITextField!
    var arrChar : [CharacterModel]  = []
    var CharacterManager = characterManger()
    func characterUpdate(char: CharacterModel) {
        self.arrChar.append(char)
    }
    func fetchit(){
        var p = 1
        CharacterManager.fetch(n: p)
//        while p != 4 {
//            CharacterManager.fetch(n: p)
//            p += 1
//        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 137
        let chcell = TableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as! characterTableViewCell
        chcell.characterLabel.text = arrChar[indexPath.row].name
        chcell.numberLabel.text = "\(indexPath.row+1)"
        let url = URL(string: arrChar[indexPath.row].pic)
        if let data = try? Data(contentsOf: url!){
            chcell.characterImage.image = UIImage(data: data)
        }
        chcell.characterImage.layer.cornerRadius = chcell.characterImage.frame.height/2
        chcell.characterImage.clipsToBounds = true
        return chcell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CharacterManager.delegate = self
        fetchit()
        TableView.delegate = self
        TableView.dataSource = self
        SerchField.layer.cornerRadius = 10
    }
}
