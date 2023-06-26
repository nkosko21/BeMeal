//
//  NewPostViewController.swift
//  BeMeal
//
//  Created by Ahamadou Bah on 6/24/23.
//

import UIKit
import PhotosUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage

class NewPostViewController: UIViewController {
    let timeFormater = DateFormatter()
    let myDateFormatter = DateFormatter()
    let newPostScreen = NewPostView()
    var selectedType = ""
    var selectedImage: UIImage?
    var currentUser:User?
    var timestamp: String?
    var timer: Timer!
    let database = Firestore.firestore()
    let storage = Storage.storage()
    let childProgressView = ProgressSpinnerViewController()
    
    
    override func loadView() {
        view = newPostScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupGestures()

        
        newPostScreen.mealTypeButton.menu = getMealTypeMenu()
        newPostScreen.pictureButton.menu = getMenuImagePicker()
        
        myDateFormatter.dateStyle = .medium
        myDateFormatter.timeStyle = .medium
        timeFormater.timeStyle = .short
        timeFormater.dateStyle = .none
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)
    }
    
    @objc func tick() {
        timestamp = myDateFormatter.string(from: Date())
        newPostScreen.labelDateTime.text = myDateFormatter.string(from: Date())
    }
    
    //MARK: menu for buttonTakePhoto setup...
    func getMenuImagePicker() -> UIMenu{
        let menuItems = [
            UIAction(title: "Camera",handler: {(_) in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery",handler: {(_) in
                self.pickPhotoFromGallery()
            })
        ]
        
        return UIMenu(title: "Select source", children: menuItems)
    }
    
    //MARK: Take Photo using Camera...
    func pickUsingCamera(){
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
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
    
    //MARK: Clears keyboard on tap
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    
    //MARK: Helper for clear keyboard
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    //MARK: Sets menu for phone type button...
    func getMealTypeMenu() -> UIMenu {
        var menuItems = [UIAction]()
        for type in MealTypes.types{
            let menuItem = UIAction(title: type,handler: {(_) in
                                self.selectedType = type
                                self.newPostScreen.mealTypeButton.setTitle(self.selectedType, for: .normal)
                            })
            menuItems.append(menuItem)
        }
        return UIMenu(title: "Select type", children: menuItems)
    }
    
    private func setupNavigationBar() {
        let labelTitle = UILabel()
        labelTitle.font = .systemFont(ofSize: 30)
        labelTitle.textColor = .white
        labelTitle.text = "BeMeal."
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        
        navigationItem.titleView = labelTitle
        
        let barText = UIBarButtonItem(
            title: "Post",
            style: .plain,
            target: self,
            action: #selector(onButtonUploadPost)
        )
        
        navigationItem.rightBarButtonItem = barText
    }
}

extension NewPostViewController:ProgressSpinnerDelegate{
    func showActivityIndicator(){
        addChild(childProgressView)
        view.addSubview(childProgressView.view)
        childProgressView.didMove(toParent: self)
    }
    
    func hideActivityIndicator(){
        childProgressView.willMove(toParent: nil)
        childProgressView.view.removeFromSuperview()
        childProgressView.removeFromParent()
    }
}

