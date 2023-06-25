//
//  SocialFeedProgressManager.swift
//  BeMeal
//
//  Created by Ahamadou Bah on 6/25/23.
//

import Foundation

extension SocialFeedViewController:ProgressSpinnerDelegate{
    func showActivityIndicator(){
        addChild(childProgressView)
        view.addSubview(childProgressView.view)
        childProgressView.didMove(toParent: self)
    }
    
    func hideActivityIndicator(){
        childProgressView.willMove(toParent: nil)
        childProgressView.view.removeFromSuperview()
        childProgressView.removeFromParent()
    }
}
