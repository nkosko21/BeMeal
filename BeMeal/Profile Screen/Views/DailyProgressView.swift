//
//  DailyProgressView.swift
//  BeMeal
//
//  Created by Nick Kosko on 6/21/23.
//

import Foundation
import UIKit

class dailyProgressView: UIView {
    var wrapperView: UIView!
    
    var dailyProgressLabel: UILabel!
    
    var caloriesLabel: UILabel!
    var caloriesImage: UIImageView!
    var currentCaloriesLabel: UILabel! // carbs and fat
    var goalCaloriesLabel: UILabel!
    
    var proteinLabel: UILabel!
    var proteinImage: UIImageView!
    var currentProteinLabel: UILabel!
    var goalProteinLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupWrapper()
        setupLabels()
        setupImages()
        initConstraints()
    }
    
    func setupWrapper() {
        wrapperView = UIView()
        wrapperView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperView)
    }
    
    func setupImages() {
        caloriesImage = UIImageView()
        caloriesImage.image = UIImage(systemName: "carrot")
        caloriesImage.contentMode = .scaleToFill
        caloriesImage.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(caloriesImage)
        
        proteinImage = UIImageView()
        proteinImage.image = UIImage(systemName: "carrot")
        proteinImage.contentMode = .scaleToFill
        proteinImage.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(proteinImage)
    }
    
    func setupLabels() {
        dailyProgressLabel = UILabel()
        dailyProgressLabel.font = dailyProgressLabel.font.withSize(30)
        dailyProgressLabel.text = "Daily Progress"
        dailyProgressLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(dailyProgressLabel)
        
        caloriesLabel = UILabel()
        caloriesLabel.font = caloriesLabel.font.withSize(20)
        caloriesLabel.text = "Calories"
        caloriesLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(caloriesLabel)
        
        currentCaloriesLabel = UILabel()
        currentCaloriesLabel.font = currentCaloriesLabel.font.withSize(12)
        currentCaloriesLabel.text = "Current Calories: 0"
        currentCaloriesLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(currentCaloriesLabel)
        
        goalCaloriesLabel = UILabel()
        goalCaloriesLabel.font = goalCaloriesLabel.font.withSize(12)
        goalCaloriesLabel.text = "Goal Calories: 2000"
        goalCaloriesLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(goalCaloriesLabel)
        
        proteinLabel = UILabel()
        proteinLabel.font = proteinLabel.font.withSize(20)
        proteinLabel.text = "Protein"
        proteinLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(proteinLabel)
        
        currentProteinLabel = UILabel()
        currentProteinLabel.font = currentProteinLabel.font.withSize(12)
        currentProteinLabel.text = "Current Protein: 0g"
        currentProteinLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(currentProteinLabel)
        
        goalProteinLabel = UILabel()
        goalProteinLabel.font = goalProteinLabel.font.withSize(12)
        goalProteinLabel.text = "Goal Protein: 100g"
        goalProteinLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(goalProteinLabel)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            wrapperView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            wrapperView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            wrapperView.topAnchor.constraint(equalTo: self.topAnchor),
            wrapperView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            dailyProgressLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),
            dailyProgressLabel.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor),
            dailyProgressLabel.topAnchor.constraint(equalTo: wrapperView.topAnchor),
            
            caloriesLabel.topAnchor.constraint(equalTo: dailyProgressLabel.bottomAnchor),
            caloriesLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),
            
            caloriesImage.topAnchor.constraint(equalTo: dailyProgressLabel.bottomAnchor),
            caloriesImage.leadingAnchor.constraint(equalTo: caloriesLabel.trailingAnchor),
            
            currentCaloriesLabel.topAnchor.constraint(equalTo: caloriesImage.bottomAnchor),
            currentCaloriesLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),
            
            goalCaloriesLabel.topAnchor.constraint(equalTo: currentCaloriesLabel.bottomAnchor),
            goalCaloriesLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),
            
            proteinLabel.topAnchor.constraint(equalTo: goalCaloriesLabel.bottomAnchor, constant: 20),
            proteinLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),
            
            proteinImage.topAnchor.constraint(equalTo: goalCaloriesLabel.bottomAnchor, constant: 20),
            proteinImage.leadingAnchor.constraint(equalTo: proteinLabel.trailingAnchor),
            
            currentProteinLabel.topAnchor.constraint(equalTo: proteinLabel.bottomAnchor),
            currentProteinLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),
            
            goalProteinLabel.topAnchor.constraint(equalTo: currentProteinLabel.bottomAnchor),
            goalProteinLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
