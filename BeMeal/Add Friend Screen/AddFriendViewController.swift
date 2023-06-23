//
//  AddFriendViewController.swift
//  BeMeal
//
//  Created by Nick Kosko on 6/23/23.
//

import Foundation
import UIKit

class addFriendViewController: UIViewController {
    var searchedFriends = [User]()
    var addFriendScreen = addFriendView()
    
    override func loadView() {
        view = addFriendScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addFriendScreen.searchButton.addTarget(self, action: #selector(searchFriend), for: .touchUpInside)
    }
}
