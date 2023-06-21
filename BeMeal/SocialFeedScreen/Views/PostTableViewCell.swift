//
//  PostTableViewCell.swift
//  BeMeal
//
//  Created by Ahamadou Bah on 6/17/23.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    var imageProfile: UIImageView!
    var wrapperCellView: UIView!
    var labelUser: UILabel!
    var labelDate: UILabel!
    var labelMeal: UILabel!
    var textMacros: UITextView!
    var imageFood: UIImageView!
    var textCaption: UITextView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .black
        
        setupWrapperCellView()
        setupProfilePic()
        setupLabelUser()
        setupLabelDate()
        setupLabelMeal()
        setupImageFood()
        setupMacros()
        setupCaption()
        initConstraints()
    }
    
    func setupProfilePic(){
        imageProfile = UIImageView()
        imageProfile.image = UIImage(systemName: "person.circle.fill")?.withRenderingMode(.alwaysOriginal)
        imageProfile.contentMode = .scaleToFill
        imageProfile.clipsToBounds = true
        imageProfile.layer.masksToBounds = true
        imageProfile.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageProfile)
    }
    
    func setupLabelUser() {
        labelUser = UILabel()
        labelUser.text = "Example User"
        labelUser.textColor = .white
        labelUser.font = .boldSystemFont(ofSize: 24)
        labelUser.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelUser)
    }
    
    func setupLabelDate() {
        labelDate = UILabel()
        labelDate.text = "XX/XX/XXXX 00:00 AM"
        labelDate.textColor = .white
        labelDate.font = .systemFont(ofSize: 18)
        labelDate.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelDate)
    }
    
    func setupLabelMeal() {
        labelMeal = UILabel()
        labelMeal.text = "Breakfast at"
        labelMeal.textColor = .white
        labelMeal.font = .systemFont(ofSize: 18)
        labelMeal.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelMeal)
    }
    
    func setupMacros(){
        textMacros = UITextView()
        textMacros.isEditable = false
        textMacros.textColor = .white
        textMacros.backgroundColor = UIColor.black.withAlphaComponent(0.75)

        textMacros.text = "Proteins: 0 g / Carbs: 0 g / Fats: 0 g"
        textMacros.font = .systemFont(ofSize: 15)
        textMacros.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(textMacros)
    }
    
    
    func setupImageFood() {
        imageFood = UIImageView()
        imageFood.image = UIImage(systemName: "camera.fill")
        imageFood.sizeToFit()
        imageFood.contentMode = .scaleAspectFill
        imageFood.clipsToBounds = true
        imageFood.layer.cornerRadius = 10
        imageFood.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(imageFood)
    }
    
    func setupCaption() {
        textCaption = UITextView()
        textCaption.isEditable = false
        textCaption.textColor = .white
        textCaption.backgroundColor = UIColor.black.withAlphaComponent(0.75)

        textCaption.text = "..........."
        textCaption.font = .systemFont(ofSize: 20)
        textCaption.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(textCaption)
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
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -3),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            imageProfile.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
            imageProfile.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 8),
            imageProfile.heightAnchor.constraint(equalToConstant: 30),
            imageProfile.widthAnchor.constraint(equalToConstant: 30),
            
            labelUser.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
            labelUser.leadingAnchor.constraint(equalTo: imageProfile.trailingAnchor, constant: 5),
            
            labelMeal.topAnchor.constraint(equalTo: labelUser.bottomAnchor, constant: 2),
            labelMeal.leadingAnchor.constraint(equalTo: labelUser.leadingAnchor),
            
            labelDate.topAnchor.constraint(equalTo: labelUser.bottomAnchor, constant: 2),
            labelDate.leadingAnchor.constraint(equalTo: labelMeal.trailingAnchor, constant: 3),
            
            
            textCaption.bottomAnchor.constraint(equalTo: wrapperCellView.bottomAnchor),
            textCaption.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 5),
            textCaption.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -5),
            textCaption.heightAnchor.constraint(equalToConstant: 100),
            
            imageFood.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 70),
            imageFood.bottomAnchor.constraint(equalTo: wrapperCellView.bottomAnchor),
            imageFood.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 5),
            imageFood.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -5),
            imageFood.heightAnchor.constraint(equalToConstant: 300),
            imageFood.widthAnchor.constraint(equalToConstant: 200),
            
            textMacros.topAnchor.constraint(equalTo: imageFood.topAnchor),
            textMacros.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 5),
            textMacros.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -5),
            textMacros.heightAnchor.constraint(equalToConstant: 50),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 600)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
