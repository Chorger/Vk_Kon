//
//  User.swift
//  Vk_Kon
//
//  Created by Timofey Koloshenko on 22/08/2019.
//  Copyright © 2019 Timofey Koloshenko. All rights reserved.
//

import Foundation

class TableViewCellModel : Comparable {
    static func < (lhs: TableViewCellModel, rhs: TableViewCellModel) -> Bool {
        return lhs.name < rhs.name
    }
    
    static func == (lhs: TableViewCellModel, rhs: TableViewCellModel) -> Bool {
        return lhs.name == rhs.name
    }
    
    var name : String
    var image : String
    
    init(name : String, image : String) {
        self.name = name
        self.image = image
    }
}
