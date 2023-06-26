//
//  RegisterViewController.swift
//  App12
//
//  Created by Sakib Miazi on 6/2/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
import PhotosUI

class RegisterViewController: UIViewController {
    
    let registerView = RegisterView()
    
    let childProgressView = ProgressSpinnerViewController()
    
    let storage = Storage.storage()
    
    let database = Firestore.firestore()
    
    var pickedImage:UIImage?
    
    
    override func loadView() {
        view = registerView
    }
    
    
    
    //MARK: Validates Email Format...
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerView.buttonRegister.addTarget(self, action: #selector(onRegisterTapped), for: .touchUpInside)
        registerView.buttonTakePhoto.menu = getMenuImagePicker()
        
        let labelTitle = UILabel()
        labelTitle.font = .systemFont(ofSize: 30)
        labelTitle.textColor = .white
        labelTitle.text = "Register"
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        
        
        navigationItem.titleView = labelTitle
        
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
    
    //MARK: take Photo using Camera...
    func pickUsingCamera(){
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }
    
    //MARK: pick Photo using Gallery...
    func pickPhotoFromGallery(){
        //MARK: Photo from Gallery...
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
        
        let photoPicker = PHPickerViewController(configuration: configuration)
        
        photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
    }
    
    @objc func onRegisterTapped(){
        //MARK: creating a new user on Firebase...
        
        if (registerView.textFieldName.text != ""
            || registerView.textFieldEmail.text != ""
            || registerView.textFieldPassword.text != "") {

            if isValidEmail(registerView.textFieldEmail.text!) {
                showActivityIndicator()
                uploadProfilePhotoToStorage()
            } else {
                showErrorAlert("Please provide valid email")
            }
        } else {
            showErrorAlert("Please fill in all fields")
        }
        
                    
        
    }
}
