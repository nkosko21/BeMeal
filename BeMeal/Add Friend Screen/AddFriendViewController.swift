//
//  AddFriendViewController.swift
//  BeMeal
//
//  Created by Nick Kosko on 6/23/23.
//

import Foundation
import UIKit
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class addFriendViewController: UIViewController {
    let database = Firestore.firestore()
    var searchedFriends = [User]()
    var addFriendScreen = addFriendView()
    var currentUser: User!
    var currentFriend: User!
    
    override func loadView() {
        view = addFriendScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addFriendScreen.searchButton.addTarget(self, action: #selector(searchFriend), for: .touchUpInside)
        addFriendScreen.addFriendButton.addTarget(self, action: #selector(addFriend), for: .touchUpInside)
    }
}
