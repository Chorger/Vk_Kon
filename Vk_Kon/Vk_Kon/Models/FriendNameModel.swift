//
//  FriendNameModel.swift
//  Vk_Kon
//
//  Created by Timofey Koloshenko on 27/08/2019.
//  Copyright © 2019 Timofey Koloshenko. All rights reserved.
//

import Foundation

class FriendNameModel : Comparable {
    static func < (lhs: FriendNameModel, rhs: FriendNameModel) -> Bool {
        return lhs.surname < rhs.surname
    }
    
    static func == (lhs: FriendNameModel, rhs: FriendNameModel) -> Bool {
        return lhs.surname == rhs.surname
    }
    
    var name : String
    var surname : String
    
    init(name : String, surname : String) {
        self.name = name
        self.surname = surname
    }
}
