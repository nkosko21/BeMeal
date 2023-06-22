//
//  ViewController.swift
//  BeMeal
//
//  Created by Nick Kosko on 6/9/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main"
        navigationController?.pushViewController(SocialFeedViewController(), animated: true)
    }


}

