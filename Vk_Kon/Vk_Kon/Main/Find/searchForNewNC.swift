//
//  searchForNewNC.swift
//  Vk_Kon
//
//  Created by Timofey Koloshenko on 22/08/2019.
//  Copyright © 2019 Timofey Koloshenko. All rights reserved.
//

import UIKit

class searchForNewNC: UINavigationController {
    
    var elementsList : [TableViewCellModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! searchForNewTVC
        vc.elementsList = elementsList
        // Чтобы при дальнейшем добавлении картинок они не дублировались
        elementsList = []
    }
}
