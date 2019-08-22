//
//  searchForNewTVC.swift
//  Vk_Kon
//
//  Created by Timofey Koloshenko on 22/08/2019.
//  Copyright © 2019 Timofey Koloshenko. All rights reserved.
//

import UIKit

class searchForNewTVC: UITableViewController {
    
    var elementsList : [TableViewCellModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elementsList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "elementCell", for: indexPath)

        // Make 'em round
        cell.imageView!.layer.cornerRadius = 20
        cell.imageView!.layer.borderWidth = 1.0
        cell.imageView!.layer.masksToBounds = true
        
        cell.imageView!.image = UIImage(named: elementsList[indexPath.row].image)
        cell.textLabel!.text = elementsList[indexPath.row].name

        return cell
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
