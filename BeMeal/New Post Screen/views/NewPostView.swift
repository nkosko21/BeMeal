//
//  NewPostView.swift
//  BeMeal
//
//  Created by Ahamadou Bah on 6/24/23.
//

import UIKit

class NewPostView: UIView {
    var pictureButton: UIButton!
    var textCaption: UITextView!
    var mealTypeButton: UIButton!
    var selectedType: String = "Select Meal Type"
    var textInputProtein: UITextField!
    var textInputCarbs: UITextField!
    var textInputFats: UITextField!

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        
        setupPictureButton()
        setupCaption()
        setupMacros()
        setupMealType()
        
        initConstraints()
    }
   
    private func setupPictureButton() {
        pictureButton = UIButton()
        pictureButton.setTitle("", for: .normal)
        pictureButton.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        pictureButton.showsMenuAsPrimaryAction = true
        pictureButton.contentHorizontalAlignment = .fill
        pictureButton.contentVerticalAlignment = .fill
        pictureButton.imageView?.contentMode = .scaleAspectFill
        pictureButton.backgroundColor = .black
        pictureButton.layer.cornerRadius = 6.0
        pictureButton.layer.shadowColor = UIColor.gray.cgColor
        pictureButton.layer.shadowOffset = .zero
        pictureButton.layer.shadowRadius = 4.0
        pictureButton.layer.shadowOpacity = 0.7
        pictureButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(pictureButton)
    }
    
    func setupCaption() {
        textCaption = UITextView()
        textCaption.isEditable = true
        textCaption.textColor = .white
        textCaption.backgroundColor = UIColor.darkGray

        textCaption.text = "Add caption here..."
        textCaption.font = .systemFont(ofSize: 20)
        
        textCaption.layer.cornerRadius = 6.0
        textCaption.layer.shadowColor = UIColor.gray.cgColor
        textCaption.layer.shadowOffset = .zero
        textCaption.layer.shadowRadius = 4.0
        textCaption.layer.shadowOpacity = 0.7
        textCaption.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textCaption)
    }
    
    func setupMacros() {
        textInputProtein = UITextField()
        textInputProtein.placeholder = "Click to Input Protein"
        textInputProtein.borderStyle = .roundedRect
        textInputProtein.keyboardType = .decimalPad
        textInputProtein.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textInputProtein)
        
        textInputCarbs = UITextField()
        textInputCarbs.placeholder = "Click to Input Carbs"
        textInputCarbs.borderStyle = .roundedRect
        textInputCarbs.keyboardType = .decimalPad
        textInputCarbs.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textInputCarbs)
        
        textInputFats = UITextField()
        textInputFats.placeholder = "Click to Input Fats"
        textInputFats.backgroundColor = .none
        textInputFats.borderStyle = .roundedRect
        textInputFats.keyboardType = .decimalPad
        textInputFats.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textInputFats)
    }
    
    func setupMealType() {
        mealTypeButton = UIButton(type: .system)
        mealTypeButton.setTitle(selectedType, for: .normal)
        mealTypeButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        mealTypeButton.tintColor = .white
        mealTypeButton.showsMenuAsPrimaryAction = true
        mealTypeButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(mealTypeButton)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            mealTypeButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            mealTypeButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            
            textInputProtein.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            textInputProtein.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textInputProtein.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            
            textInputCarbs.topAnchor.constraint(equalTo: textInputProtein.bottomAnchor, constant: 5),
            textInputCarbs.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textInputCarbs.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            
            textInputFats.topAnchor.constraint(equalTo: textInputCarbs.bottomAnchor, constant: 5),
            textInputFats.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textInputFats.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -5),

            
            pictureButton.topAnchor.constraint(equalTo: textCaption.bottomAnchor, constant: 10),
            pictureButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            pictureButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            pictureButton.heightAnchor.constraint(equalToConstant: 500),
            pictureButton.widthAnchor.constraint(equalToConstant: 200),
            
            textCaption.topAnchor.constraint(equalTo: textInputFats.bottomAnchor),
            textCaption.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            textCaption.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            textCaption.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
