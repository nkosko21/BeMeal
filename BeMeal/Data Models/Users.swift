//
//  Users.swift
//  BeMeal
//
//  Created by Ahamadou Bah on 6/22/23.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable{
    @DocumentID var id: String?
    var name: String
    var email: String
    var photoURL: String
    // var friends: [User]
    
    
    init(name: String, email: String, photoURL: String) {
        self.name = name
        self.email = email
        self.photoURL = photoURL
    }
}
