//
//  SettingsViewCell.swift
//  goCM
//
//  Created by Arturo Plottier on 20/8/17.
//  Copyright © 2017 pac-apps. All rights reserved.
//

import UIKit

//Used to communicate between MainListCollectionViewCell and ViewController
protocol SettingsListColectionViewCellDelegate {
    func changeColorOfButton(forCell: SettingsViewCell)
}

class SettingsViewCell: UICollectionViewCell {
    
    var delegate: SettingsListColectionViewCellDelegate? = nil
    var cellDefaultConnImage: UIImageView = {
        let image = UIImageView() //frame: CGRect(x: (contentView.frame.width - 200)/2, y: (contentView.frame.height - 40)/2, width: 200, height: 40))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "check")
        return image
    }()

    
    var cellLabel: UILabel = {
        let label = UILabel() //frame: CGRect(x: (contentView.frame.width - 200)/2, y: (contentView.frame.height - 40)/2, width: 200, height: 40))
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    var cellEditConnImage: UIImageView = {
//        let image = UIImageView() //frame: CGRect(x: (contentView.frame.width - 200)/2, y: (contentView.frame.height - 40)/2, width: 200, height: 40))
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.contentMode = .scaleAspectFill
//        image.image = UIImage(named: "edit-1")
//        return image
//    }()
    
    var cellEditConnImage: UIButton = {
        let image = UIButton() //frame: CGRect(x: (contentView.frame.width - 200)/2, y: (contentView.frame.height - 40)/2, width: 200, height: 40))
        image.setImage(UIImage(named: "edit-1"), for: .normal)
        image.tintColor = UIColor.rgb(91, green: 14, blue: 13)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()

   
    func configure(with settingsConnection: SettingsConnection) {
        if (settingsConnection.boolDefault) {
            cellDefaultConnImage.image = UIImage(named: "check")
        }
        else{
            cellDefaultConnImage.image = UIImage(named: "blank")
        }
            contentView.addSubview(cellDefaultConnImage)
            addConstraintsWithFormat( "H:|-13-[v0(24)]", views: cellDefaultConnImage)
            addConstraintsWithFormat( "V:|-8-[v0(24)]", views: cellDefaultConnImage)
        
       
        if settingsConnection.textConnection != nil {
            cellLabel.text = settingsConnection.textConnection
            cellLabel.contentMode = .scaleAspectFill
            cellLabel.clipsToBounds = true
            contentView.addSubview(cellLabel)
            addConstraintsWithFormat( "H:|-63-[v0(200)]", views: cellLabel)
            addConstraintsWithFormat( "V:|-8-[v0(24)]", views: cellLabel)
        }
        
            cellEditConnImage.setImage(UIImage(named: "edit-1"), for: .normal)
            cellEditConnImage.contentMode = .scaleAspectFill
            //cellImage.clipsToBounds = true
            contentView.addSubview(cellEditConnImage)
            addConstraintsWithFormat( "H:[v0(24)]-13-|", views: cellEditConnImage)
            addConstraintsWithFormat( "V:|-8-[v0(24)]", views: cellEditConnImage)
        
        
     //   addConstraintsWithFormat( "H:|-8-[v0(24)]-8-[v1(200)]-[v2(24)]-8-|", views: cellDefaultConnImage, cellLabel,cellEditConnImage)
        
//        addConstraintsWithFormat( "V:|-5-[v0(24)]|", views: cellDefaultConnImage)
//        
//        addConstraintsWithFormat( "V:|-5-[v0(24)]|", views: cellLabel)
//        addConstraintsWithFormat( "V:|-5-[v0(24)]|", views: cellEditConnImage)

//        addConstraint(NSLayoutConstraint(item: cellDefaultConnImage, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
//        addConstraint(NSLayoutConstraint(item: cellLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
//         addConstraint(NSLayoutConstraint(item: cellEditConnImage, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))

    }
    
    
    override func prepareForReuse() {
        cellLabel.text = nil
        super.prepareForReuse()
    }
    
   }

