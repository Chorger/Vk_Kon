//
//  friendsTVC.swift
//  Vk_Kon
//
//  Created by Timofey Koloshenko on 22/08/2019.
//  Copyright © 2019 Timofey Koloshenko. All rights reserved.
//

import UIKit

class friendsTVC: UITableViewController {
    
    var friendsList : [User] = []
    var imagesNames : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        friendsList.append(User(name: "Аня Мех", image: "message_annImage"))
        friendsList.append(User(name: "Ася Гагарина", image: "asyagagarinamskImage"))
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath)

        cell.imageView!.image = UIImage(named: friendsList[indexPath.row].image)
        cell.textLabel!.text = friendsList[indexPath.row].name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            for index in 1...5 {
                imagesNames.append("message_annImage" + String(index))
            }
        }
        else if indexPath.row == 1 {
            for index in 1...5 {
                imagesNames.append("asyagagarinamskImage" + String(index))
            }
        }
        performSegue(withIdentifier: "showFriendsImages", sender: nil)
    }

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! friendsImagesCVC
        vc.imagesNames = imagesNames
        // Чтобы при дальнейшем добавлении картинок они не дублировались
        imagesNames = []
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
}
