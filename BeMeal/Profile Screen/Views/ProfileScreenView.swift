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
    var dailyProgress: UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setupButton()
        setupLabels()
        setupDailyProgress()
        initConstraints()
    }
    
    func setupButton() {
        profilePic = UIImageView()
        profilePic.contentMode = .scaleToFill
        profilePic.image = UIImage(systemName: "person")
        profilePic.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(profilePic)
    }
    
    func setupLabels() {
        nameLabel = UILabel()
        nameLabel.font = nameLabel.font.withSize(20)
        nameLabel.text = "Example Name"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel)
        
        usernameLabel = UILabel()
        usernameLabel.font = nameLabel.font.withSize(10)
        usernameLabel.text = "Example Username"
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(usernameLabel)
        
        streakCountLabel = UILabel()
        streakCountLabel.font.withSize(15)
        streakCountLabel.text = "Current Streak: 0 🔥"
        streakCountLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(streakCountLabel)
    }
    
    func setupDailyProgress() {
        dailyProgress = UIView()
        dailyProgress = dailyProgressView()
        dailyProgress.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(dailyProgress)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            profilePic.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            profilePic.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            profilePic.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            profilePic.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 250),
            profilePic.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: profilePic.bottomAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            usernameLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            streakCountLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor),
            streakCountLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            dailyProgress.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 200),
            dailyProgress.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
