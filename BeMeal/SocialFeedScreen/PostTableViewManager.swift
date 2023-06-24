//
//  PostTableViewManager.swift
//  BeMeal
//
//  Created by Ahamadou Bah on 6/20/23.
//

import Foundation
import UIKit

extension SocialFeedViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewPost, for: indexPath) as! PostTableViewCell

        //MARK: Fills in cell ui elements...

        cell.labelUser.text = "\(posts[indexPath.row].user.name) (\(posts[indexPath.row].user.email))"
        
        if let url = URL(string: posts[indexPath.row].user.photoURL ) {
            cell.imageProfile.loadRemoteImage(from: url)
        } else {
            cell.imageFood.image = UIImage()
        }

       
        
        cell.labelMeal.text = "\(posts[indexPath.row].mealType) at "
        
        cell.labelDate.text = posts[indexPath.row].date
        
        cell.textCaption.text = "\(posts[indexPath.row].caption)"
        
        if let url = URL(string: posts[indexPath.row].photoURL) {
            cell.imageFood.loadRemoteImage(from: url)
        } else {
            cell.imageFood.image = UIImage()
        }
        
        let protein = posts[indexPath.row].macros[0]
        let carbs = posts[indexPath.row].macros[1]
        let fats = posts[indexPath.row].macros[2]
        cell.textMacros.text = "Protein: \(protein)g  /  Carbs: \(carbs)g  /  Fats: \(fats)g"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

