//
//  DisplayMessage.swift
//  goCM
//
//  Created by Arturo Plottier on 13/9/17.
//  Copyright © 2017 pac-apps. All rights reserved.
//

import UIKit

class DisplayMessage {
    
    static let instance = DisplayMessage()
    private init() {}

//    var alert: UIView = {
//        let cv = UIView()
////        let messLabel = UILabel()
////        messLabel.text = "" //"Test Successfull"
////        messLabel.textAlignment = .center
////        messLabel.textColor = .white
////        cv.addSubview(messLabel)
////        cv.addConstraintsWithFormat( "H:|[v0]|", views: messLabel)
////        cv.addConstraintsWithFormat("V:|[v0]|", views: messLabel)
//        cv.backgroundColor = .red
//        return cv
//    }()

    func showMessage(message : String, color: UIColor) {
        if let window = UIApplication.shared.keyWindow {
            let alert = UIView()
            alert.backgroundColor = color
            window.addSubview(alert)
            window.addConstraintsWithFormat( "H:|[v0]|", views: alert)
            window.addConstraintsWithFormat("V:[v0(30)]|", views: alert)
            let messLabel = UILabel()
            messLabel.text = ""
            messLabel.text = message //"Test Successfull"
            messLabel.textAlignment = .center
            messLabel.textColor = .white
            alert.addSubview(messLabel)
            alert.addConstraintsWithFormat( "H:|[v0]|", views: messLabel)
            alert.addConstraintsWithFormat("V:|[v0]|", views: messLabel)
            
            alert.alpha = 0.0
            UIView.animate(withDuration: 2.0, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {
                alert.alpha = 1.0
            }, completion: {
                (finished: Bool) -> Void in
                
                //Once the label is completely invisible, set the text and fade it back in
                //   self.alert.text = "Bird Type: Swift"
                
                // Fade in
                UIView.animate(withDuration: 2.0, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {
                    alert.alpha = 0.0
                }, completion: nil)
            })
        }
    }

}
