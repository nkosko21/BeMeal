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
    var labelDate: UILabel!
    var timer: Timer?
    var posts = [Post]()
    
    override func loadView() {
        view = socialFeedScreen
        posts.append(Post(image: UIImage(systemName: "camera.fill")!, user: "Example User", macros: Macros(protein: 130, carbs: 100, fats: 50), caption: "Tester 1 2 3", mealType: "Breakfast", date: "XX/XX/XXXX"))
    }
    
    //MARK: Pick Photo using Gallery...
    func pickPhotoFromGallery(){
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
        
        
        let photoPicker = PHPickerViewController(configuration: configuration)
        photoPicker.delegate = self
        
        present(photoPicker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "BeMeal."
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 20)
        ]
        
        setupNavigationBar()
        
                
        //MARK: Put the floating button above all the views...
        view.bringSubviewToFront(socialFeedScreen.floatingButtonNewPost)
        
        socialFeedScreen.tableViewPost.delegate = self
        socialFeedScreen.tableViewPost.dataSource = self
    }

    func setupNavigationBar() {
        let barIcon = UIBarButtonItem(
            image: UIImage(systemName: "person.fill"),
            style: .plain,
            target: self,
            action: nil
        )
        
        navigationItem.rightBarButtonItem = barIcon
        
        let titleLabel = UILabel()
    }


}
