//
//  Friend.swift
//  BeMeal
//
//  Created by Nick Kosko on 6/24/23.
//

import Foundation
import FirebaseFirestoreSwift

class friend: Codable {
    @DocumentID var id: String?
    var email: String
    var isFriend: Bool
    
    init(email: String, isFriend: Bool) {
        self.email = email
        self.isFriend = isFriend
    }
}
