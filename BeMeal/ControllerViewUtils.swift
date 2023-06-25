//
//  ControllerViewUtils.swift
//  BeMeal
//
//  Created by Ahamadou Bah on 6/24/23.
//

import Foundation
import UIKit
import FirebaseFirestoreSwift
import Firebase

extension UIViewController {
    //MARK: Displays Error Alert...
    func showErrorAlert(_ message:String){
            let alert = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            
            self.present(alert, animated: true)
    }
}


