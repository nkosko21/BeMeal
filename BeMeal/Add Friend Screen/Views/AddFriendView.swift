//
//  AddFriendView.swift
//  BeMeal
//
//  Created by Nick Kosko on 6/23/23.
//

import Foundation
import UIKit

class addFriendView: UIView {
    var searchBar: UITextField!
    var searchButton: UIButton!
    
    var searchedFriendImage: UIImageView!
    var searchedFriendName: UILabel!
    var searchedFriendEmail: UILabel!
    var addFriendButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSearchBar()
        setupButton()
        setupSearchedFriend()
        initConstraints()
    }
    
    func setupButton() {
        searchButton = UIButton(type: .system)
        searchButton.setTitle("Search", for: .normal)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(searchButton)
        
        addFriendButton = UIButton(type: .system)
        addFriendButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(addFriendButton)
    }
    
    func setupSearchBar() {
        searchBar = UITextField()
        searchBar.backgroundColor = .white
        searchBar.borderStyle = .roundedRect
        searchBar.placeholder = "Enter new friend here"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(searchBar)
    }
    
    func setupSearchedFriend() {
        searchedFriendImage = UIImageView()
        searchedFriendImage.contentMode = .scaleToFill
        searchedFriendImage.clipsToBounds = true
        searchedFriendImage.layer.masksToBounds = true
        searchedFriendImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(searchedFriendImage)
        
        searchedFriendName = UILabel()
        searchedFriendName.textColor = .white
        searchedFriendName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(searchedFriendName)
        
        searchedFriendEmail = UILabel()
        searchedFriendEmail.textColor = .white
        searchedFriendEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(searchedFriendEmail)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
        searchBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
        searchBar.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
        searchBar.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
        
        searchButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        searchButton.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
        
        searchedFriendImage.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 20),
        searchedFriendImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
        searchedFriendImage.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
        searchedFriendImage.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -175),
        
        searchedFriendName.topAnchor.constraint(equalTo: searchedFriendImage.bottomAnchor),
        searchedFriendName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        
        searchedFriendEmail.topAnchor.constraint(equalTo: searchedFriendName.bottomAnchor),
        searchedFriendEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        
        addFriendButton.topAnchor.constraint(equalTo: searchedFriendEmail.bottomAnchor, constant: 10),
        addFriendButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
