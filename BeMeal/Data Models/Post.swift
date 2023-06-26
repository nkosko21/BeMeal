//
//  Post.swift
//  BeMeal
//
//  Created by Ahamadou Bah on 6/17/23.
//

import Foundation
import UIKit
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Post:Codable {
    @DocumentID var id: String?
    var photoURL: String
    var macros: [Int]
    var caption: String
    var mealType: String
    var date: String
    var user: User
    
    init(photoURL: String, macros: [Int], caption: String, mealType: String, date: String, user: User) {
        self.photoURL = photoURL
        self.macros = macros
        self.caption = caption
        self.mealType = mealType
        self.date = date
        self.user = user
    }
}

struct PostRef:Codable {
    @DocumentID var id: String?
    var ref: DocumentReference
    
    init(ref: DocumentReference) {
        self.ref = ref
    }
}
