//
//  episodeTableViewCell.swift
//  ricky and morty
//
//  Created by V UMESH KUMAR RAJU on 18/07/21.
//

import UIKit

class episodeTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    @IBOutlet var episodeCollectionView: UICollectionView!
    
    @IBOutlet var SeasonName: UILabel!
    var epi = [EpisodeModel]()
    var image = #imageLiteral(resourceName: "season1")

    func configure(with models:[EpisodeModel] ){
        self.epi = models
        episodeCollectionView.reloadData()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        episodeCollectionView.delegate = self
        episodeCollectionView.dataSource = self
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return epi.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = episodeCollectionView.dequeueReusableCell(withReuseIdentifier: "episode", for: indexPath) as! episodeCollectionViewCell
        epi[indexPath.row].show()
        cell.configure(with: epi[indexPath.row])
        cell.seasonImage.image  = image
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 193, height: 255)
    }
    
}
