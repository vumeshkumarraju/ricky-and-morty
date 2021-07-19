//
//  SingleCharViewController.swift
//  ricky and morty
//
//  Created by V UMESH KUMAR RAJU on 18/07/21.
//

import UIKit

class SingleCharViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var originLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var LalLabel: UILabel!
    @IBOutlet var charImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        charImage.layer.cornerRadius = 8
        charImage.clipsToBounds = true
        nameLabel.text = singleChar.name
        infoLabel.text = singleChar.status
        originLabel.text = singleChar.origin
        genderLabel.text = singleChar.gender
        let url = URL(string: singleChar.pic)
        if let data = try? Data(contentsOf: url!){
            charImage.image = UIImage(data: data)
        }
    }
    var singleChar = CharacterModel(name: "name", pic: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", origin: "Origin", gender: "Gender", LAL: "Lal", status: "Status")
    
}
