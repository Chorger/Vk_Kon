//
//  newsCellTVC.swift
//  Vk_Kon
//
//  Created by Timofey Koloshenko on 26/08/2019.
//  Copyright © 2019 Timofey Koloshenko. All rights reserved.
//

import UIKit

class newsCellTVC: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var optionalTextLabel: UILabel!
    @IBOutlet weak var optionalImageImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var amountOfViewsLabel: UILabel!
    
    var amountOfLikes : Int = 0
    var liked : Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        likeButton.setTitle("♡ " + String(amountOfLikes), for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        avatarImageView.image = nil
        sourceLabel.text = nil
        optionalTextLabel.text = nil
        optionalImageImageView.image = nil
        likeButton.setTitle(nil, for: .normal)
    }
    
    @IBAction func likeButtonPressed(_ sender: Any) {
        if liked {
            amountOfLikes -= 1
            liked = false
            likeButton.setTitle("♡ " + String(amountOfLikes), for: .normal)
        }
        else {
            amountOfLikes += 1
            liked = true
            likeButton.setTitle("♥ " + String(amountOfLikes), for: .normal)
        }
    }
}
