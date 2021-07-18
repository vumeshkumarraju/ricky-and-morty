//
//  locationTableViewCell.swift
//  ricky and morty
//
//  Created by V UMESH KUMAR RAJU on 18/07/21.
//

import UIKit

class locationTableViewCell: UITableViewCell {

    @IBOutlet var locationView: UIView!
    @IBOutlet var locationName: UILabel!
    @IBOutlet var locationNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        locationView.layer.cornerRadius = 5
        locationView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
