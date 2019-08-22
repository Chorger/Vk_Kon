//
//  friendsImagesViewCell.swift
//  Vk_Kon
//
//  Created by Timofey Koloshenko on 22/08/2019.
//  Copyright © 2019 Timofey Koloshenko. All rights reserved.
//

import UIKit

class friendsImagesViewCell: UICollectionViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    
    func setImageViaName(imageName : String) {
        self.cellImageView.image = UIImage(named: imageName)
    }
    
    func setImage(image : UIImage)
    {
        self.cellImageView.image = image
    }
}
