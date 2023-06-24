//
//  FriendCell.swift
//  BeMeal
//
//  Created by Nick Kosko on 6/23/23.
//

import Foundation
import UIKit

class friendCell: UITableViewCell {
    var wrapperCellView: UITableViewCell!
    
    var image: UIImageView!
    
    var name: UILabel!
    var email: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        
        setupWrapperCellView()
        setupImage()
        setupLabels()
        initConstraints()
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        
        //working with the shadows and colors...
        wrapperCellView.backgroundColor = .black
        wrapperCellView.layer.cornerRadius = 6.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 4.0
        wrapperCellView.layer.shadowOpacity = 0.7
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupImage() {
        image = UIImageView(image: UIImage(systemName: "person"))
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        wrapperCellView.addSubview(image)
    }
    
    func setupLabels() {
        name = UILabel()
        name.text = "Johnny Appleseed"
        name.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(name)
        
        email = UILabel()
        email.text = "johnny@apple.seed"
        email.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(email)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -3),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        
            image.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor),
            image.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 10),
            image.bottomAnchor.constraint(equalTo: wrapperCellView.bottomAnchor, constant: 10),
            
            name.topAnchor.constraint(equalTo: image.topAnchor),
            name.leadingAnchor.constraint(equalTo: image.trailingAnchor),
            
            email.topAnchor.constraint(equalTo: name.bottomAnchor),
            email.leadingAnchor.constraint(equalTo: image.trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
