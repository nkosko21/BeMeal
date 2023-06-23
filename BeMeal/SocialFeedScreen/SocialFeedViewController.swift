//
//  SocialFeedViewController.swift
//  BeMeal
//
//  Created by Ahamadou Bah on 6/17/23.
//

import UIKit
import PhotosUI
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

class SocialFeedViewController: UIViewController {
    let myDateFormatter = DateFormatter()
    let socialFeedScreen = SocialFeedView()
    var selectedImage: UIImage?
    var handleAuth: AuthStateDidChangeListenerHandle?
    var currentUser:FirebaseAuth.User?
    let database = Firestore.firestore()
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
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
        //MARK: handling if the Authentication state is changed (sign in, sign out, register)...
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            if user == nil{
                //MARK: not signed in...
                self.currentUser = nil
                self.socialFeedScreen.labelWelcome.text = "Please sign in/register!"
                self.disableButtons()
                
                
                //MARK: Reset tableView...
                self.posts.removeAll()
                self.socialFeedScreen.tableViewPost.reloadData()
                
                //MARK: Sign in bar button...
                self.setupRightBarButton(isLoggedin: false)
                
            } else {
                self.currentUser = user
                self.socialFeedScreen.labelWelcome.text = "Welcome \(user?.displayName ?? "Anonymous")! Please select a meal feed"
                self.enableButtons()
                
                //MARK: Logout bar button...
                self.setupRightBarButton(isLoggedin: true)
            }
        }
                
        //MARK: Put the floating button above all the views...
        view.bringSubviewToFront(socialFeedScreen.floatingButtonNewPost)
        
        socialFeedScreen.buttonBreakfastFeed.addTarget(self, action: #selector(onButtonDisplayBreakfast), for: .touchUpInside)
        socialFeedScreen.buttonLunchFeed.addTarget(self, action: #selector(onButtonDisplayLunch), for: .touchUpInside)
        socialFeedScreen.buttonDinnerFeed.addTarget(self, action: #selector(onButtonDisplayDinner), for: .touchUpInside)
        
        socialFeedScreen.tableViewPost.delegate = self
        socialFeedScreen.tableViewPost.dataSource = self
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)
    }
    
    func enableButtons() {
        self.socialFeedScreen.floatingButtonNewPost.isEnabled = true
        self.socialFeedScreen.floatingButtonNewPost.isHidden = false
        self.socialFeedScreen.buttonBreakfastFeed.isEnabled = true
        self.socialFeedScreen.buttonBreakfastFeed.isHidden = false
        self.socialFeedScreen.buttonLunchFeed.isEnabled = true
        self.socialFeedScreen.buttonLunchFeed.isHidden = false
        self.socialFeedScreen.buttonDinnerFeed.isEnabled = true
        self.socialFeedScreen.buttonDinnerFeed.isHidden = false
    }
    
    func disableButtons() {
        self.socialFeedScreen.floatingButtonNewPost.isEnabled = false
        self.socialFeedScreen.floatingButtonNewPost.isHidden = true
        self.socialFeedScreen.buttonBreakfastFeed.isEnabled = false
        self.socialFeedScreen.buttonBreakfastFeed.isHidden = true
        self.socialFeedScreen.buttonLunchFeed.isEnabled = false
        self.socialFeedScreen.buttonLunchFeed.isHidden = true
        self.socialFeedScreen.buttonDinnerFeed.isEnabled = false
        self.socialFeedScreen.buttonDinnerFeed.isHidden = true
    }

    func setupNavigationBar() {
        let labelTitle = UILabel()
        labelTitle.font = .systemFont(ofSize: 30)
        labelTitle.textColor = .white
        labelTitle.text = "BeMeal."
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        navigationItem.titleView = labelTitle
    }

   
    
    @objc func tick() {
        socialFeedScreen.labelDateTime.text = DateFormatter.localizedString(from: Date(),
                                                              dateStyle: .medium,
                                                              timeStyle: .medium)
    }
    
    @objc func onButtonDisplayBreakfast() {
        socialFeedScreen.buttonBreakfastFeed.tintColor = .white
        socialFeedScreen.buttonLunchFeed.tintColor = .none
        socialFeedScreen.buttonDinnerFeed.tintColor = .none
        
        self.database.collection("breakfastPost")
            .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
                if let documents = querySnapshot?.documents{
                    self.posts.removeAll()
                    for document in documents{
                        do{
                            print(document)
                            let post  = try document.data(as: Post.self)
                            self.posts.append(post)
                        }catch{
                            print(error)
                        }
                    }
                    self.posts.sort(by: {
                        self.myDateFormatter.date(from: $0.date)! < self.myDateFormatter.date(from: $1.date)!})
                    self.socialFeedScreen.tableViewPost.reloadData()
                }
            })
    }
    
    @objc func onButtonDisplayLunch() {
        socialFeedScreen.buttonBreakfastFeed.tintColor = .none
        socialFeedScreen.buttonLunchFeed.tintColor = .white
        socialFeedScreen.buttonDinnerFeed.tintColor = .none
    }
    
    @objc func onButtonDisplayDinner() {
        socialFeedScreen.buttonBreakfastFeed.tintColor = .none
        socialFeedScreen.buttonLunchFeed.tintColor = .none
        socialFeedScreen.buttonDinnerFeed.tintColor = .white
    }
    
}
