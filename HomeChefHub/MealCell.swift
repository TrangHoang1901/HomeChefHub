//
//  MealCell.swift
//  HomeChefHub
//
//  Created by Helen Hoang on 11/8/23.
//

import UIKit



class MealCell: UITableViewCell {

    @IBOutlet weak var mealImageView: UIImageView!
    
    @IBOutlet weak var mealNameLabel: UILabel!
    
    @IBOutlet weak var mealTagsLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}




