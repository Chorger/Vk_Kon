//
//  NewsTVC.swift
//  Vk_Kon
//
//  Created by Timofey Koloshenko on 26/08/2019.
//  Copyright © 2019 Timofey Koloshenko. All rights reserved.
//

import UIKit
import func AVFoundation.AVMakeRect

class NewsTVC: UITableViewController {
    
    // it is also used in newsCellTVC class
    static let notificationName = Notification.Name("isLikedNotification")
    
    var newsList : [NewsCellModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(isLikedNotificationRecieved(notificationData:)),
                                               name: NewsTVC.notificationName, object: nil)
        
        tableView.register(UINib(nibName: "newsCell", bundle: nil),
                           forCellReuseIdentifier: "newsCell")
        
        
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.reloadData()
        
        newsList.append(NewsCellModel(source: "Dodo Pizza", avatarImage: "dodoImage",
                                      optionalImage: "dodoCupImage",
                                      optionalText: "Дарим стаканчику вторую жизнь ♻",
                                      amountOfLikes: 268, isLiked : false,
                                      amountOfViews: 32367))
        newsList.append(NewsCellModel(source: "flattmatt", avatarImage: "flattmattLogo",
                                      optionalImage: "flattmattFujiImage",
                                      optionalText: "Будь спокоен как Фудзи",
                                      amountOfLikes: 91, isLiked : true,
                                      amountOfViews: 4431))
        newsList.append(NewsCellModel(source: "MAGIC MINIST", avatarImage: "magicministLogo",
                                      optionalImage: "magicministImage",
                                      optionalText: """
                                                    Ваш близкий все ждёт письмо?😀✉\n
                                                    Так сделайте ему ПОДАРОК😅😍\n\n
                                                    Для заказа пишите нашему менеджеру Марии💃\n
                                                    Отвечаем в любое время
                                                    """,
                                      amountOfLikes: 5, isLiked : false,
                                      amountOfViews: 439))
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func makeLikeButtonText(amountOfLikes : Int, isLiked : Bool) -> String {
        var textToReturn = ""
        
        if isLiked { textToReturn += "♥ " }
        else { textToReturn += "♡ " }
        
        if amountOfLikes >= 1000 {
            textToReturn += String(amountOfLikes / 1000) + "K"
        }
        else {
            textToReturn += String(amountOfLikes)
        }
        
        return textToReturn
    }
    
    @objc func isLikedNotificationRecieved(notificationData : Notification) {
        newsList[(notificationData.userInfo?["newsId"]) as? Int ?? -1].amountOfLikes =
            (notificationData.userInfo?["newAmountOfLikes"] as? Int ?? -1)
        
        newsList[(notificationData.userInfo?["newsId"]) as? Int ?? -1].isLiked =
            (notificationData.userInfo?["isLiked"] as? Bool ?? true)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! newsCellTVC

        cell.sourceLabel.text = newsList[indexPath.row].source
        cell.avatarImageView.image =
            UIImage(named: newsList[indexPath.row].avatarImage)
        cell.optionalImageImageView.image =
            UIImage(named: newsList[indexPath.row].optionalImage)
        cell.optionalTextLabel.text = newsList[indexPath.row].optionalText
        cell.amountOfLikes = newsList[indexPath.row].amountOfLikes
        cell.isLiked = newsList[indexPath.row].isLiked
        cell.newsId = indexPath.row
        
        cell.likeButton.setTitle(
            makeLikeButtonText(
                amountOfLikes: newsList[indexPath.row].amountOfLikes,
                isLiked: newsList[indexPath.row].isLiked),
            for: .normal)
        
        if newsList[indexPath.row].amountOfViews >= 1000 {
            cell.amountOfViewsLabel.text = "👁‍🗨 " + String(newsList[indexPath.row].amountOfViews / 1000) + "K"
        }
        else {
            cell.amountOfViewsLabel.text = "👁‍🗨 " + String(newsList[indexPath.row].amountOfViews)
        }
        
//        let percentage = (cell.optionalImageImageView?.bounds.width ?? 326) / UIScreen.main.bounds.width
//        print("Соотношение между шириной imageView и рамками зоны")
//        print(percentage)
//        let result = UIImage(named: newsList[indexPath.row].optionalImage)!.size.width /
//            cell.optionalImageImageView!.bounds.width
//
//        cell.optionalImageImageView.frame =
//            CGRect(x: 0, y: 0, width: cell.optionalImageImageView!.bounds.width,
//                   height: UIImage(named: newsList[indexPath.row].optionalImage)!.size.height / result)
//        print("Высота imageView")
//        print(UIImage(named: newsList[indexPath.row].optionalImage)!.size.height / result)
        
        print("Высота после настройки")
        print(cell.optionalImageImageView.bounds.height)
        
        print("")

        return cell
    }
    
    func resizeImage(imageName : String, targetSize: CGSize) -> UIImage? {
        guard let image = UIImage(named: imageName) else {
            return nil
        }
        
        let finalRect = AVMakeRect(
            aspectRatio: image.size, insideRect: CGRect(
                origin: CGPoint(x: 0, y: 0), size: targetSize))
        
        let renderer = UIGraphicsImageRenderer(size: finalRect.size)
        return renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: finalRect.size))
        }
    }
    
    

    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
