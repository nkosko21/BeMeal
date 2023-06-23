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

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSearchBar()
        setupButton()
        initConstraints()
    }
    
    func setupButton() {
        searchButton = UIButton(type: .system)
        searchButton.setTitle("Search", for: .normal)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(searchButton)
    }
    
    func setupSearchBar() {
        searchBar = UITextField()
        searchBar.backgroundColor = .white
        searchBar.borderStyle = .roundedRect
        searchBar.placeholder = "Enter new friend here"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(searchBar)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
        searchBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
        searchBar.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
        searchBar.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
        
        searchButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        searchButton.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10)
        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
