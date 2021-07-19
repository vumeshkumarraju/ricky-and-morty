//
//  singleLocationCollectionViewCell.swift
//  ricky and morty
//
//  Created by V UMESH KUMAR RAJU on 19/07/21.
//

import UIKit

class singleLocationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var charImage: UIImageView!
    @IBOutlet var charName: UILabel!
    
    var imageUrl : String = "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
    override func awakeFromNib() {
        super.awakeFromNib()
        let url = URL(string: imageUrl)
        if let data = try? Data(contentsOf: url!){
            charImage.image = UIImage(data: data)
        }
        charImage.layer.cornerRadius = charImage.frame.height/2
        charImage.layer.borderWidth = 2
    }
    
}
