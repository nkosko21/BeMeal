//
//  SearchBarButtonManager.swift
//  BeMeal
//
//  Created by Nick Kosko on 6/23/23.
//

import Foundation
import UIKit

extension addFriendViewController {
    @objc func searchFriend() {
        let name = addFriendScreen.searchBar.text
        if name != "" {
            let collectionUsers = database
                .collection("users")
            
            collectionUsers
                .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
                    if let documents = querySnapshot?.documents{
                        self.searchedFriends.removeAll()
                        for document in documents{
                            do{
                                let user = try document.data(as: User.self)
                                self.searchedFriends.append(user)
                            }catch{
                                print(error)
                            }
                        }
                        
                        for friend in self.searchedFriends {
                            if friend.name == name {
                                self.currentFriend = friend
                                
                                self.getFriendDetails(friend: friend)
                                self.addFriendScreen.addFriendButton.setTitle("Add Friend", for: .normal)
                                
                                return
                            }
                        }
                        
                        let alert = UIAlertController(title: "Alert", message: "There is no user with that name", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .default))
                        self.present(alert, animated: true)
                    }})
        } else {
            let alert = UIAlertController(title: "Alert", message: "Enter the name of new friend", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true)
        }
    }
    
    // this is the user that the person searched for
    func getFriendDetails(friend: User) {
        addFriendScreen.searchedFriendEmail.text = friend.email
        addFriendScreen.searchedFriendName.text = friend.name
        
        if let url = URL(string: friend.photoURL) {
            addFriendScreen.searchedFriendImage.loadRemoteImage(from: url)
        }
    }
}
