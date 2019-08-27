//
//  NewsTVC.swift
//  Vk_Kon
//
//  Created by Timofey Koloshenko on 26/08/2019.
//  Copyright © 2019 Timofey Koloshenko. All rights reserved.
//

import UIKit

class NewsTVC: UITableViewController {
    
    var newsList : [NewsCellModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "newsCell", bundle: nil),
                           forCellReuseIdentifier: "newsCell")
        
        newsList.append(NewsCellModel(source: "Dodo Pizza", avatarImage: "dodoImage",
                                      optionalImage: "dodoCupImage",
                                      optionalText: "Дарим стаканчику вторую жизнь ♻",
                                      amountOfLikes: 268, amountOfViews: 32000))
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! newsCellTVC

        // Configure the cell...
        cell.sourceLabel.text = newsList[indexPath.row].source
        cell.avatarImageView.image =
            UIImage(named: newsList[indexPath.row].avatarImage)
        cell.optionalImageImageView.image =
            UIImage(named: newsList[indexPath.row].optionalImage)
        cell.optionalTextLabel.text = newsList[indexPath.row].optionalText
        cell.amountOfLikes = newsList[indexPath.row].amountOfLikes
        cell.amountOfViewsLabel.text = String(newsList[indexPath.row].amountOfViews)

        return cell
    }

    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
