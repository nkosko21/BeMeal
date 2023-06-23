//
//  SocialFeedView.swift
//  BeMeal
//
//  Created by Ahamadou Bah on 6/17/23.
//

import UIKit

class SocialFeedView: UIView {

    var labelDateTime: UILabel!
    var labelWelcome: UILabel!
    var buttonBreakfastFeed: UIButton!
    var buttonLunchFeed: UIButton!
    var buttonDinnerFeed: UIButton!
    var tableViewPost: UITableView!
    var floatingButtonNewPost: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        
        setupDateTime()
        setupWelcome()
        setupButtonFeeds()
        setupTableViewPost()
        setupFloatingButtonNewPost()
        
        initConstraints()
    }
    
    func setupDateTime() {
        labelDateTime = UILabel()
        labelDateTime.font = .systemFont(ofSize: 15)
        labelDateTime.textColor = .white
        labelDateTime.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelDateTime)
    }
    
    func setupWelcome() {
        labelWelcome = UILabel()
        labelWelcome.font = .systemFont(ofSize: 18)
        labelWelcome.text = "Please sign-in"
        labelWelcome.textColor = .white
        labelWelcome.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelWelcome)
    }
    
    func setupButtonFeeds() {
        buttonBreakfastFeed = UIButton(type: .system)
        buttonBreakfastFeed.setTitle("Breakfast", for: .normal)
        buttonBreakfastFeed.setImage(UIImage(systemName: "cup.and.saucer.fill"), for: .normal)
        buttonBreakfastFeed.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonBreakfastFeed)
        
        buttonLunchFeed = UIButton(type: .system)
        buttonLunchFeed.setTitle("Lunch", for: .normal)
        buttonLunchFeed.setImage(UIImage(systemName: "takeoutbag.and.cup.and.straw.fill"), for: .normal)
        buttonLunchFeed.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonLunchFeed)
        
        buttonDinnerFeed = UIButton(type: .system)
        buttonDinnerFeed.setTitle("Dinner", for: .normal)
        buttonDinnerFeed.setImage(UIImage(systemName: "wineglass.fill"), for: .normal)
        buttonDinnerFeed.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonDinnerFeed)
    }
    
    func setupTableViewPost() {
        tableViewPost = UITableView()
        tableViewPost.register(PostTableViewCell.self, forCellReuseIdentifier: Configs.tableViewPost)
        tableViewPost.backgroundColor = .black
        tableViewPost.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewPost)
    }
    
    func setupFloatingButtonNewPost(){
        floatingButtonNewPost = UIButton(type: .system)
        floatingButtonNewPost.setTitle("", for: .normal)
        floatingButtonNewPost.setImage(UIImage(systemName: "fork.knife.circle.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        floatingButtonNewPost.contentHorizontalAlignment = .fill
        floatingButtonNewPost.contentVerticalAlignment = .fill
        floatingButtonNewPost.imageView?.contentMode = .scaleAspectFit
        floatingButtonNewPost.layer.cornerRadius = 16
        floatingButtonNewPost.imageView?.layer.shadowOffset = .zero
        floatingButtonNewPost.imageView?.layer.shadowRadius = 0.8
        floatingButtonNewPost.imageView?.layer.shadowOpacity = 0.7
        floatingButtonNewPost.imageView?.clipsToBounds = true
        floatingButtonNewPost.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(floatingButtonNewPost)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            labelDateTime.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 3),
            labelDateTime.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelWelcome.topAnchor.constraint(equalTo: labelDateTime.bottomAnchor, constant: 3),
            labelWelcome.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonBreakfastFeed.topAnchor.constraint(equalTo: labelWelcome.bottomAnchor, constant: 2),
            buttonBreakfastFeed.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant: 5),
            
            buttonLunchFeed.topAnchor.constraint(equalTo: labelWelcome.bottomAnchor, constant: 2),
            buttonLunchFeed.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonDinnerFeed.topAnchor.constraint(equalTo: labelWelcome.bottomAnchor, constant: 2),
            buttonDinnerFeed.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            
    
            
            tableViewPost.topAnchor.constraint(equalTo: buttonBreakfastFeed.bottomAnchor, constant: 8),
            tableViewPost.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            tableViewPost.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 4),
            tableViewPost.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -4),
            
            
            floatingButtonNewPost.widthAnchor.constraint(equalToConstant: 48),
            floatingButtonNewPost.heightAnchor.constraint(equalToConstant: 48),
            floatingButtonNewPost.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            floatingButtonNewPost.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
