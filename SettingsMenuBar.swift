//
//  SettingsMenuBar.swift
//  goCM
//
//  Created by Arturo Plottier on 20/8/17.
//  Copyright © 2017 pac-apps. All rights reserved.
//

import UIKit

class Settings: NSObject {
    let imageName: String
    let settingsName: String
    
    init( imageName: String, settingsName: String) {
        self.imageName = imageName
        self.settingsName = settingsName
    }
    
}


class SettingsMenuBar: UIView {
    var settingsLauncher: SettingsLauncher?
    
    let imageView :UIButton = {
        let iv = UIButton() //(frame: CGRect(x: 0, y: 0, width: 22, height: 22)) // UIButton(image: UIImage(named: "gotrim")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMore))
        iv.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        iv.setImage(UIImage(named: "leftarrow"), for: .normal)
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .clear
        iv.tintColor = UIColor.rgb(91, green: 14, blue: 13)
        return iv
    }()
    
    let settingslbl: UILabel = {
        let lbl =  UILabel() //frame: CGRect(x: 0, y: 0, width: frame.width , height: frame.height))
        lbl.text = "Settings"
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textColor = UIColor.rgb(91, green: 14, blue: 13)
        lbl.backgroundColor = .clear
        return lbl
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
      //  let horizontalBarView = UIView()
          self.backgroundColor = GlobalVars.instance.GlobalBackgroundColor()

//        addSubview(horizontalBarView)
//        horizontalBarView.backgroundColor = GlobalVars.instance.GlobalBackgroundColor() //UIColor.rgb(215, green: 230, blue: 239)
//        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
//        horizontalBarView.topAnchor.constraint(equalTo: self.topAnchor, constant: 1).isActive = true
//        horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 1).isActive = true
//       // addConstraintsWithFormat( "H:|[v0]|", views: horizontalBarView)
//        addConstraintsWithFormat( "V:|[v0(65)]", views: horizontalBarView)

        
        
        addSubview(imageView)
          addConstraintsWithFormat( "H:|-10-[v0(22)]", views: imageView)
        addConstraintsWithFormat( "V:[v0(22)]-8-|", views: imageView)
        
        // imageView.translatesAutoresizingMaskIntoConstraints = false
       // imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
       // imageView.contentHorizontalAlignment = .left
       // imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
      //  imageView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 1).isActive = true


        addSubview(settingslbl)
        addConstraintsWithFormat( "H:|[v0]|", views: settingslbl)
        addConstraintsWithFormat( "V:[v0(22)]-8-|", views: settingslbl)
        
        
        
       // addConstraintsWithFormat("H:|-10-[v0(22)]-10-[v1]-10-|", views: imageView, settingslbl)
    }
    
    //var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?

        
    func handleDismiss() {
        settingsLauncher?.handleDismiss()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
