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
    }
    
   
}
