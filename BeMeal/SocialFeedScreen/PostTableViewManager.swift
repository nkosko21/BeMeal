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
//        cell.labelUser.text = posts[indexPath.row].user
//        cell.labelMeal.text = "\(posts[indexPath.row].mealType) at "
//        cell.labelDate.text = posts[indexPath.row].date
//        cell.textCaption.text = "Caption: \(posts[indexPath.row].caption)"
//        cell.imageFood.image = selectedImage
//        let protein = posts[indexPath.row].macros.protein
//        let carbs = posts[indexPath.row].macros.carbs
//        let fats = posts[indexPath.row].macros.fats
//        cell.textMacros.text = "Protein: \(protein)g  /  Carbs: \(carbs)g  /  Fats: \(fats)g"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        pickPhotoFromGallery()
//        tableView.deselectRow(at: indexPath, animated: true)
    }
}

