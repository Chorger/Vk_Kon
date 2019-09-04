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
    var isLiked : Bool?
    var newsId : Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
        likeButton.setTitle("", for: .normal)
        amountOfLikes = 0
        isLiked = nil
        newsId = nil
    }
    
    func sendLikeButtonNotification(newAmountOfLikes : Int, isLiked : Bool) {
        NotificationCenter.default.post(
            name: NewsTVC.notificationName, object: nil,
            userInfo:["newAmountOfLikes": newAmountOfLikes, "isLiked": isLiked,
                      "newsId": newsId ?? 0])
    }
    
    @IBAction func likeButtonPressed(_ sender: Any) {
        if isLiked ?? false {
            sendLikeButtonNotification(newAmountOfLikes: amountOfLikes - 1, isLiked: false)
            amountOfLikes -= 1
            isLiked = false
            likeButton.setTitle("♡ " + String(amountOfLikes), for: .normal)
        }
        else {
            sendLikeButtonNotification(newAmountOfLikes: amountOfLikes + 1, isLiked: true)
            amountOfLikes += 1
            isLiked = true
            likeButton.setTitle("♥ " + String(amountOfLikes), for: .normal)
        }
    }
}
