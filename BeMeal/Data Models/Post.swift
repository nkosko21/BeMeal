//
//  Post.swift
//  BeMeal
//
//  Created by Ahamadou Bah on 6/17/23.
//

import Foundation
import UIKit
import FirebaseFirestoreSwift

struct Post:Codable {
    @DocumentID var id: String?
    var photoURL: String
    var macros: [Int]
    var caption: String
    var mealType: String
    var date: String
    var username: String
    
    init(photoURL: String, userEmail: String, macros: [Int], caption: String, mealType: String, date: String, username: String) {
        self.photoURL = photoURL
        self.macros = macros
        self.caption = caption
        self.mealType = mealType
        self.date = date
        self.username = username
        
    }
}
