//
//  ProfileScreenViewController.swift
//  BeMeal
//
//  Created by Nick Kosko on 6/21/23.
//

import Foundation
import UIKit
import FirebaseFirestore
import FirebaseFirestoreSwift
import Firebase


class profileScreenViewController: UIViewController {
    var profileScreen = profileScreenView()
    let database = Firestore.firestore()
    var myPost = [PostRef]()
    var currentUser: User?
    
    override func viewWillAppear(_ animated: Bool) {
        //MARK: Observe Firestore database to display the contacts list...
        self.database.collection("users")
            .document((currentUser?.email)!)
            .collection("myPost")
            .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
                if let documents = querySnapshot?.documents{
                    self.myPost.removeAll()
                    for document in documents{
                        do{
                            let postRef  = try document.data(as: PostRef.self)
                            self.myPost.append(postRef)
                            
                        }catch{
                            print(error)
                        }
                    }
                    self.profileScreen.streakCountLabel.text = "Your meal count: \(self.myPost.count) 🔥"
                }
            })
    }
    
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
        
        profileScreen.nameLabel.text = currentUser?.name
        profileScreen.usernameLabel.text = currentUser?.email
    }
    
   
}
