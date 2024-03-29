//
//  groupsTVC.swift
//  Vk_Kon
//
//  Created by Timofey Koloshenko on 22/08/2019.
//  Copyright © 2019 Timofey Koloshenko. All rights reserved.
//

import UIKit

class groupsTVC: UITableViewController {

    var groups : [TableViewCellModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groups.append(TableViewCellModel(name: "Strogino Group", image: "stroginoGroupLogo"))
        groups.append(TableViewCellModel(name: "flattmatt", image: "flattmattLogo"))
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath)

        // Make 'em round
        cell.imageView!.layer.cornerRadius = 20
        cell.imageView!.layer.borderWidth = 1.0
        cell.imageView!.layer.masksToBounds = true
        
        cell.imageView!.image = UIImage(named: groups[indexPath.row].image)
        cell.textLabel!.text = groups[indexPath.row].name

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
