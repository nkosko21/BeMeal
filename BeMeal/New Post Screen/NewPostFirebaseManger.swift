//
//  NewPostButtonManger.swift
//  BeMeal
//
//  Created by Ahamadou Bah on 6/25/23.
//

import Foundation

extension NewPostViewController {
    @objc func onButtonUploadPost() {
        var postPhotoURL:URL?

        print("Start posting")
        
        if newPostScreen.textInputProtein.text == "" || newPostScreen.textInputCarbs.text == "" || newPostScreen.textInputFats.text == "" {
            showErrorAlert("Please input the number of grams macros...")
        } else if !isInt(possibleInt: newPostScreen.textInputProtein.text!) || !isInt(possibleInt: newPostScreen.textInputCarbs.text!) || !isInt(possibleInt: newPostScreen.textInputFats.text!) {
            showErrorAlert("Please make sure all macros as entered as whole numbers")
        } else {
            if let timeText = newPostScreen.labelDateTime.text,
                let currentTime =  myDateFormatter.date(from: timeText) {
                
                var setTime: Date?
                
                //MARK: Determines when the user can make this type of post
                if selectedType.lowercased() ==  "breakfast" {
                    setTime = Date().setTime(hour: 4, min: 0, sec: 0)
                } else if selectedType.lowercased() ==  "lunch" {
                    setTime = Date().setTime(hour: 12, min: 0, sec: 0)
                } else if selectedType.lowercased() ==  "dinner" {
                    setTime = Date().setTime(hour: 19, min: 0, sec: 0)
                } else {
                    setTime = nil
                    print("no meal type")
                }
                
                
                

                if setTime == nil {
                    showErrorAlert("Please select meal type")
                } else if currentTime < setTime! {
                    showErrorAlert("Not \(selectedType.lowercased()) time yet! Please wait till \(timeFormater.string(from: setTime!))")
                } else {
                    print("Current:\(currentTime)  Set:\(setTime!) ")
                    
                    if let image = selectedImage{
                        if let jpegData = image.jpegData(compressionQuality: 80), let uwUser = currentUser, let uwDate = timestamp {
                            let storageRef = storage.reference()
                            let imagesRepo = storageRef.child("imagePost")
                            let imageRef = imagesRepo.child("\(uwUser.email)_\(uwDate).jpg")



                            let uploadTask = imageRef.putData(jpegData, completion: {(metadata, error) in
                                if error == nil{
                                    imageRef.downloadURL(completion: {(url, error) in
                                        if error == nil{
                                            postPhotoURL = url
                                            self.showActivityIndicator()
                                            self.sendPostToFirebase(photoURL: postPhotoURL)
                                        }
                                    })
                                }
                            })
                        }
                    } else {
                        showErrorAlert("Please select an image...")
                    }
                }
            }
        }
    }
    
    
    func sendPostToFirebase(photoURL: URL?) {
        if let uwUser = currentUser, let uwDate = timestamp, let uwURL = photoURL, let protein = newPostScreen.textInputProtein.text, let carbs = newPostScreen.textInputCarbs.text, let fats = newPostScreen.textInputFats.text {
            let newPost = Post(photoURL: uwURL.description,
                               macros: [Int(protein) ?? 0,
                                        Int(carbs) ?? 0,
                                        Int(fats) ?? 0],
                               caption: newPostScreen.textCaption.text,
                               mealType: selectedType.lowercased(),
                               date: uwDate,
                               user: uwUser)
            
            let collectionPost = database
                .collection("\(selectedType.lowercased())Post")
                .document("\(uwUser.email): \(uwDate)")
            
            
            do{
                try collectionPost.setData(from: newPost, completion: {(error) in
                    if error == nil{
                        //MARK: hide progress indicator...
                        self.hideActivityIndicator()

                        self.navigationController?.popViewController(animated: true)
                    }
                })
            }catch{
                showErrorAlert("Error creating post!")
            }
        }
    }
}
