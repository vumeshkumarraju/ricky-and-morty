//
//  episodeCollectionViewCell.swift
//  ricky and morty
//
//  Created by V UMESH KUMAR RAJU on 18/07/21.
//

import UIKit

class episodeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var seasonImage: UIImageView!
    @IBOutlet var episodeName: UILabel!
    @IBOutlet var airDate: UILabel!
    public func configure(with model:EpisodeModel){
        self.episodeName.text = model.name
        self.airDate.text = model.AiredOn
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
