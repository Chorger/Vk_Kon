//
//  newsCellModel.swift
//  Vk_Kon
//
//  Created by Timofey Koloshenko on 26/08/2019.
//  Copyright © 2019 Timofey Koloshenko. All rights reserved.
//

import Foundation

class NewsCellModel {
    var source : String
    var avatarImage : String
    var optionalImage : String
    var optionalText : String
    var amountOfLikes : Int
    var isLiked : Bool
    var amountOfViews : Int
    
    init(source : String, avatarImage : String,
         optionalImage : String, optionalText : String,
         amountOfLikes : Int, isLiked : Bool,
         amountOfViews : Int) {
        self.source = source
        self.avatarImage = avatarImage
        self.optionalImage = optionalImage
        self.optionalText = optionalText
        self.amountOfLikes = amountOfLikes
        self.isLiked = isLiked
        self.amountOfViews = amountOfViews
    }
}
