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
        cell.labelUser.text = posts[indexPath.row].user.name
        cell.labelMeal.text = "\(posts[indexPath.row].mealType) at "
        cell.labelDate.text = posts[indexPath.row].date
        cell.textCaption.text = "\(posts[indexPath.row].caption)"
        if let url = URL(string: posts[indexPath.row].photoURL) {
            cell.imageFood.loadRemoteImage(from: url)
        } else {
            cell.imageFood.image = UIImage()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        pickPhotoFromGallery()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

