//
//  MealTableViewCell.swift
//  Food Tracker
//
//  Created by Juyong Lee on 05/12/2018.
//  Copyright © 2018 Juyong Lee. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    //  MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
