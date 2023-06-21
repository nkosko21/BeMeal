//
//  Post.swift
//  BeMeal
//
//  Created by Ahamadou Bah on 6/17/23.
//

import Foundation
import UIKit
import FirebaseFirestoreSwift

struct Post {
    @DocumentID var id: String?
    var image: UIImage
    var user: String
    var macros: Macros
    var caption: String
    var mealType: String
    var date: String
    
    init(image: UIImage, user: String, macros: Macros, caption: String, mealType: String, date: String) {
        self.image = image
        self.user = user
        self.macros = macros
        self.caption = caption
        self.mealType = mealType
        self.date = date
    }
}
