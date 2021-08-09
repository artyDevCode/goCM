//
//  FirstViewCell.swift
//  goCM
//
//  Created by Arturo Plottier on 15/9/17.
//  Copyright © 2017 pac-apps. All rights reserved.
//
import UIKit



class FirstViewCell: UICollectionViewCell {
    
    //  var cellImage: UIImageView!
   // var delegate: FirstListColectionViewCellDelegate? = nil
    
    var cellLabel: UILabel = {
        let label = UILabel() //frame: CGRect(x: (contentView.frame.width - 200)/2, y: (contentView.frame.height - 40)/2, width: 200, height: 40))
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var cellImage: UIImageView = {
        let image = UIImageView() //frame: CGRect(x: (contentView.frame.width - 200)/2, y: (contentView.frame.height - 40)/2, width: 200, height: 40))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    
    func configure(with recordModel: RecordModel) {
        let hptrimVer = String(describing: GlobalArrays.requestConnectionModel.HPTRIMVer!)
        var hptrim = String(hptrimVer.characters.prefix(1))
        if Int64(hptrim)! > 8 {
            hptrim = "8" //If the Trim ver is greater than 8 ie CM9, the use the ver 8 default
        }
        print("aaa \(hptrim)")
       
        if let trimIcon = recordModel.TrimIcon {
             print("aaaa tsjcore\(hptrim)_\(trimIcon)")
            cellImage.image = UIImage(named: "tsjcore\(hptrim)_\(trimIcon)")
            cellImage.contentMode = .scaleAspectFill
            //cellImage.clipsToBounds = true
            contentView.addSubview(cellImage)
            addConstraintsWithFormat( "H:|-13-[v0(32)]", views: cellImage)
            addConstraintsWithFormat( "V:|-5-[v0(32)]", views: cellImage)
        }
        
        
       
        cellLabel.text = recordModel.Title
        cellLabel.contentMode = .scaleAspectFill
        cellLabel.clipsToBounds = true
        contentView.addSubview(cellLabel)
        addConstraintsWithFormat( "H:|-63-[v0(207)]", views: cellLabel)
        addConstraintsWithFormat( "V:|-5-[v0(32)]", views: cellLabel)
        
    }
    
    override func prepareForReuse() {
        cellLabel.text = nil
        cellImage.image = nil
    }
    
   }
