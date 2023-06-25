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
    let timeFormater = DateFormatter()
    let myDateFormatter = DateFormatter()
    let socialFeedScreen = SocialFeedView()
    let childProgressView = ProgressSpinnerViewController()
    var handleAuth: AuthStateDidChangeListenerHandle?
    var currentUser:FirebaseAuth.User?
    let database = Firestore.firestore()
    var timer: Timer!
    var posts = [Post]()
    var friends = [Friend]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func loadView() {
        view = socialFeedScreen
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
        //MARK: handling if the Authentication state is changed (sign in, sign out, register)...
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            if user == nil {
                //MARK: not signed in...
                self.currentUser = nil
                self.socialFeedScreen.labelWelcome.text = "Please sign in/register!"
                self.disableButtons()
                
                self.socialFeedScreen.buttonBreakfastFeed.tintColor = .none
                self.socialFeedScreen.buttonLunchFeed.tintColor = .none
                self.socialFeedScreen.buttonDinnerFeed.tintColor = .none
                
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
                
                
                //MARK: Observe Current Friends...
                self.database.collection("users")
                    .document((self.currentUser?.email)!)
                    .collection("friends")
                    .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
                        if let documents = querySnapshot?.documents{
                            self.friends.removeAll()
                            for document in documents{
                                do {
                                    let friend  = try document.data(as: Friend.self)
                                    print(friend)
                                    self.friends.append(friend)
                                } catch{
                                    print(error)
                                }
                            }
                            
                            self.friends.sort(by: {$0.email < $1.email})
                        }
                })
            }
        }
                
        //MARK: Put the floating button above all the views...
        view.bringSubviewToFront(socialFeedScreen.floatingButtonNewPost)
        
        socialFeedScreen.buttonBreakfastFeed.addTarget(self, action: #selector(onButtonDisplayBreakfast), for: .touchUpInside)
        socialFeedScreen.buttonLunchFeed.addTarget(self, action: #selector(onButtonDisplayLunch), for: .touchUpInside)
        socialFeedScreen.buttonDinnerFeed.addTarget(self, action: #selector(onButtonDisplayDinner), for: .touchUpInside)
        socialFeedScreen.floatingButtonNewPost.addTarget(self, action: #selector(onButtonNewPost), for: .touchUpInside)
        
        socialFeedScreen.tableViewPost.delegate = self
        socialFeedScreen.tableViewPost.dataSource = self
        
        myDateFormatter.dateStyle = .medium
        myDateFormatter.timeStyle = .medium
        timeFormater.timeStyle = .short
        timeFormater.dateStyle = .none

        
        
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
        socialFeedScreen.labelDateTime.text = myDateFormatter.string(from: Date())
    }
    
    @objc func onButtonNewPost() {
        let newPostScreen = NewPostViewController()
        if let uwName = currentUser?.displayName, let uwEmail = currentUser?.email, let uwURL = currentUser?.photoURL {
            newPostScreen.currentUser = User(name: uwName, email: uwEmail, photoURL: uwURL.description)
            newPostScreen.timestamp = socialFeedScreen.labelDateTime.text
        }
       
        navigationController?.pushViewController(newPostScreen, animated: true)
    }
    
    @objc func onButtonDisplayBreakfast() {
        if let timeText = socialFeedScreen.labelDateTime.text {
            let setTime = Date().setTime(hour: 4, min: 0, sec: 0)
            
            if let currentTime =  myDateFormatter.date(from: timeText) {
//              print("Current:\(currentTime)  Set:\(setTime!) ")
                if currentTime < setTime! {
                    showErrorAlert("Not breakfast time yet. Please wait till 4:00 AM")
                } else {
                    showActivityIndicator()
                    //MARK: Change Button Colors to select Breakfast...
                    socialFeedScreen.buttonBreakfastFeed.tintColor = .white
                    socialFeedScreen.buttonLunchFeed.tintColor = .none
                    socialFeedScreen.buttonDinnerFeed.tintColor = .none
                    
                    //MARK: Change Table to Breakfast Feed...
                    self.database.collection("breakfastPost")
                        .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
                            if let documents = querySnapshot?.documents{
                                self.posts.removeAll()
                                for document in documents{
                                    do{
                                        let post  = try document.data(as: Post.self)
                                        if self.friends.contains(where: {$0.isFriend == true && $0.email == post.user.email} ) {
                                            self.posts.append(post)
                                        }
                                    }catch{
                                        print(error)
                                    }
                                }

                                self.posts.sort(by: {
                                    self.myDateFormatter.date(from: $0.date)! > self.myDateFormatter.date(from: $1.date)!})
                                
                                self.socialFeedScreen.tableViewPost.reloadData()
                                self.hideActivityIndicator()
                            }
                    })
                }
            }
        }
    }
    
    @objc func onButtonDisplayLunch() {
        if let timeText = socialFeedScreen.labelDateTime.text {
            let setTime = Date().setTime(hour: 12, min: 0, sec: 0)
            
            if let currentTime =  myDateFormatter.date(from: timeText) {
//              print("Current:\(currentTime)  Set:\(setTime!) ")
                if currentTime < setTime! {
                    showErrorAlert("Not lunch time yet! Please wait till 12:00 PM")
                } else {
                    showActivityIndicator()
                    //MARK: Change Button Colors to select Lunch...
                    socialFeedScreen.buttonBreakfastFeed.tintColor = .none
                    socialFeedScreen.buttonLunchFeed.tintColor = .white
                    socialFeedScreen.buttonDinnerFeed.tintColor = .none
                    
                    
                    //MARK: Change Table to Lunch Feed...
                    self.database.collection("lunchPost")
                        .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
                            if let documents = querySnapshot?.documents{
                                self.posts.removeAll()
                                for document in documents{
                                    do{
                                        let post  = try document.data(as: Post.self)
                                        if self.friends.contains(where: {$0.isFriend == true && $0.email == post.user.email} ) {
                                            self.posts.append(post)
                                        }
                                    }catch{
                                        print(error)
                                    }
                                }
                                self.posts.sort(by: {
                                    self.myDateFormatter.date(from: $0.date)! < self.myDateFormatter.date(from: $1.date)!})
                                self.socialFeedScreen.tableViewPost.reloadData()
                                self.hideActivityIndicator()
                            }
                    })
                }
            }
        }
        
        
    }
    
    @objc func onButtonDisplayDinner() {
        if let timeText = socialFeedScreen.labelDateTime.text {
            let setTime = Date().setTime(hour: 19, min: 0, sec: 0)
            
            if let currentTime =  myDateFormatter.date(from: timeText) {
//              print("Current:\(currentTime)  Set:\(setTime!) ")
                if currentTime < setTime! {
                    showErrorAlert("Not dinner time yet! Please wait till 7:00 PM")
                } else {
                    showActivityIndicator()
                    //MARK: Change Button Colors to select Dinner...
                    socialFeedScreen.buttonBreakfastFeed.tintColor = .none
                    socialFeedScreen.buttonLunchFeed.tintColor = .none
                    socialFeedScreen.buttonDinnerFeed.tintColor = .white
                    
                    //MARK: Change Table to Dinner Feed...
                    self.database.collection("dinnerPost")
                        .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
                            if let documents = querySnapshot?.documents{
                                self.posts.removeAll()
                                for document in documents{
                                    do{
                                        print(document)
                                        let post  = try document.data(as: Post.self)
                                        if self.friends.contains(where: {$0.isFriend == true && $0.email == post.user.email} ) {
                                            self.posts.append(post)
                                        }
                                    }catch{
                                        print(error)
                                    }
                                }
                                print(self.posts)
                                self.posts.sort(by: {
                                    self.myDateFormatter.date(from: $0.date)! < self.myDateFormatter.date(from: $1.date)!})
                                self.socialFeedScreen.tableViewPost.reloadData()
                                self.hideActivityIndicator()
                            }
                    })
                }
            }
        }
    }
    
}
