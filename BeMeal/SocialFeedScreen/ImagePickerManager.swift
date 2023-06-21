//
//  ImagePickerManager.swift
//  BeMeal
//
//  Created by Ahamadou Bah on 6/21/23.
//

import Foundation
import UIKit
import PhotosUI

//MARK: adopting required protocols for PHPicker...
extension SocialFeedViewController:PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        print(results)
        
        let itemprovider = results.map(\.itemProvider)
        
        for item in itemprovider{
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(ofClass: UIImage.self, completionHandler: { (image, error) in
                    DispatchQueue.main.async{
                        if let uwImage = image as? UIImage{
                            self.selectedImage = uwImage.withRenderingMode(.alwaysOriginal)
                            self.socialFeedScreen.tableViewPost.reloadData()
                        }
                    }
                })
            }
        }
        print("reloading")
        
    }
}



