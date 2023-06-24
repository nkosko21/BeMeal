//
//  AddFriendButtonManager.swift
//  BeMeal
//
//  Created by Nick Kosko on 6/24/23.
//

import Foundation
import UIKit

extension addFriendViewController {
    @objc func addFriend() {
        let newFriend = addFriendScreen.searchedFriendEmail.text!
        
        database.collection("users").document(newFriend.lowercased()).collection("friends").document(currentUser.email.lowercased()).setData(["email": currentUser.email.lowercased(), "isFriend": true])
        database.collection("users").document(currentUser.email.lowercased()).collection("friends").document(newFriend.lowercased()).setData(["email": newFriend.lowercased(), "isFriend": true])
        
        let alert = UIAlertController(title: "Alert", message: "Friend has been added", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) {_ in
            self.navigationController?.popViewController(animated: true)
        })
        self.present(alert, animated: true)
    }
}
