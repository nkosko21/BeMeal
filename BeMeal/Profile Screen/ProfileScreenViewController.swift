//
//  ProfileScreenViewController.swift
//  BeMeal
//
//  Created by Nick Kosko on 6/21/23.
//

import Foundation
import UIKit

class profileScreenViewController: UIViewController {
    var profileScreen = profileScreenView()
    
    override func loadView() {
        view = profileScreen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let labelTitle = UILabel()
        labelTitle.font = .systemFont(ofSize: 30)
        labelTitle.textColor = .white
        labelTitle.text = "Your Profile"
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        navigationItem.titleView = labelTitle
    }
    
   
}
