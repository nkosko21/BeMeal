//
//  SocialFeedViewController.swift
//  BeMeal
//
//  Created by Ahamadou Bah on 6/17/23.
//

import UIKit
import PhotosUI

class SocialFeedViewController: UIViewController {
    let socialFeedScreen = SocialFeedView()
    var selectedImage = UIImage()
    var labelTitle: UILabel!
    var timer: Timer!
    var posts = [Post]()
    
    
    
    //MARK: Pick Photo using Gallery...
    func pickPhotoFromGallery(){
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
        
        
        let photoPicker = PHPickerViewController(configuration: configuration)
        photoPicker.delegate = self
        
        present(photoPicker, animated: true, completion: nil)
    }
    
    override func loadView() {
        view = socialFeedScreen
        posts.append(Post(image: UIImage(systemName: "camera.fill")!, user: "Example User", macros: Macros(protein: 130, carbs: 100, fats: 50), caption: "Tester 1 2 3", mealType: "Breakfast", date: "XX/XX/XXXX"))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                
        
        setupNavigationBar()
        
                
        //MARK: Put the floating button above all the views...
        view.bringSubviewToFront(socialFeedScreen.floatingButtonNewPost)
        
        socialFeedScreen.tableViewPost.delegate = self
        socialFeedScreen.tableViewPost.dataSource = self
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)
    }

    func setupNavigationBar() {
        let barIcon = UIBarButtonItem(
            image: UIImage(systemName: "person.fill"),
            style: .plain,
            target: self,
            action: #selector(onButtonNavigate)
        )
        
        let barText = UIBarButtonItem(
            title: "Profile:",
            style: .plain,
            target: self,
            action: #selector(onButtonNavigate)
        )
        
        navigationItem.rightBarButtonItems = [barIcon, barText]

        let containerTitle = UIView()
        
        
        labelTitle = UILabel()
        labelTitle.font = .systemFont(ofSize: 30)
        labelTitle.textColor = .white
        labelTitle.text = "BeMeal."
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        navigationItem.titleView = labelTitle
    }

    @objc func onButtonNavigate() {
        let profileScreen = profileScreenViewController()
        navigationController?.pushViewController(profileScreen, animated: true)
    }
    
    @objc func tick() {
        socialFeedScreen.labelDateTime.text = DateFormatter.localizedString(from: Date(),
                                                              dateStyle: .medium,
                                                              timeStyle: .medium)
    }
}
