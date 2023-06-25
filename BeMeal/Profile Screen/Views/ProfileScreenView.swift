//
//  ProfileScreenView.swift
//  BeMeal
//
//  Created by Nick Kosko on 6/21/23.
//

import Foundation
import UIKit

class profileScreenView: UIView {
    var profilePic: UIImageView!
    var nameLabel: UILabel!
    var usernameLabel: UILabel!
    var streakCountLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .black
        
        setupButton()
        setupLabels()
        initConstraints()
    }
    
    func setupButton() {
        profilePic = UIImageView()
        profilePic.contentMode = .scaleToFill
        profilePic.image = UIImage(systemName: "person")
        profilePic.clipsToBounds = true
        profilePic.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(profilePic)
    }
    
    func setupLabels() {
        nameLabel = UILabel()
        nameLabel.font = nameLabel.font.withSize(50)
        nameLabel.text = "Example Name"
        nameLabel.textColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel)
        
        usernameLabel = UILabel()
        usernameLabel.font = nameLabel.font.withSize(25)
        usernameLabel.text = "Example Username"
        usernameLabel.textColor = .white
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(usernameLabel)
        
        streakCountLabel = UILabel()
        streakCountLabel.font.withSize(25)
        streakCountLabel.text = "Current Streak: 0 🔥"
        streakCountLabel.textColor = .white
        streakCountLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(streakCountLabel)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            profilePic.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            profilePic.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            profilePic.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            profilePic.heightAnchor.constraint(equalToConstant: 300),
            profilePic.widthAnchor.constraint(equalToConstant: 300),
            profilePic.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: profilePic.bottomAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            usernameLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            streakCountLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor),
            streakCountLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
