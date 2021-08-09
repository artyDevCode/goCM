//
//  DetailViewCell.swift
//  goCM
//
//  Created by Arturo Plottier on 4/8/17.
//  Copyright © 2017 pac-apps. All rights reserved.
//

import UIKit



class DetailViewCell: UICollectionViewCell {
     
    var cellImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()

    var cellImage2: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()

    var cellLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var cellLabelTrimNumber: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var cellLabelCreatedBy: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var cellImageInfo: UIImageView = {
        let image = UIImageView()
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
        if let trimIcon = recordModel.TrimIcon {
            print("bbbb tsjcore\(hptrim)_\(trimIcon)")
            cellImage.image = UIImage(named: "tsjcore\(hptrim)_\(trimIcon)")
            cellImage.contentMode = .scaleAspectFill
            cellImage.clipsToBounds = true
            contentView.addSubview(cellImage)
            addConstraintsWithFormat( "H:|-13-[v0(20)]", views: cellImage)
            addConstraintsWithFormat( "V:|-5-[v0(20)]", views: cellImage)
        }
        
        cellImageInfo.image = UIImage(named: "info")
        cellImageInfo.contentMode = .scaleAspectFill
        cellImageInfo.clipsToBounds = true
        cellImageInfo.tintColor = GlobalVars.instance.GlobalBackgroundColor()
        contentView.addSubview(cellImageInfo)
        addConstraintsWithFormat( "H:[v0(20)]-5-|", views: cellImageInfo)
        addConstraintsWithFormat( "V:|-5-[v0(20)]", views: cellImageInfo)

        if let overlayImage =  recordModel.PropAndFieldVals!["P68"] {
            cellImage2.image = UIImage(named: overlayImage.lowercased!)
            cellImage2.contentMode = .scaleAspectFill
            contentView.addSubview(cellImage2)
            addConstraintsWithFormat( "H:|-22-[v0(20)]", views: cellImage2)
            addConstraintsWithFormat( "V:|-15-[v0(20)]", views: cellImage2)
        }
        
        cellLabel.text = recordModel.Title
        cellLabel.contentMode = .scaleAspectFill
        cellLabel.clipsToBounds = true
        cellLabel.backgroundColor = .white
        contentView.addSubview(cellLabel)
        addConstraintsWithFormat( "H:|-50-[v0(217)]", views: cellLabel)
        addConstraintsWithFormat( "V:|-5-[v0]", views: cellLabel)
        
        if let firstStr =  recordModel.PropAndFieldVals?["P2"] {
            if let secondStr =  recordModel.PropAndFieldVals?["P1"] {
                if let sizeFile = recordModel.PropAndFieldVals?["P70"] {
                    print("cccc \(firstStr as! String) (\(secondStr as! String)) -  \((sizeFile as! Int64) / 1024)")
                  cellLabelTrimNumber.text = "\(firstStr as! String) (\(secondStr as! String)) - \((sizeFile as! Int64) / 1024) MB"
                }
            }
        }
        
        cellLabelTrimNumber.contentMode = .scaleAspectFill
        cellLabelTrimNumber.clipsToBounds = true
        cellLabelTrimNumber.backgroundColor = .white
        contentView.addSubview(cellLabelTrimNumber)
        cellLabelTrimNumber.translatesAutoresizingMaskIntoConstraints = false
        cellLabelTrimNumber.leftAnchor.constraint(equalTo: cellLabel.leftAnchor).isActive = true
        cellLabelTrimNumber.topAnchor.constraint(equalTo: cellLabel.bottomAnchor).isActive = true
        cellLabelTrimNumber.widthAnchor.constraint(equalTo: cellLabel.widthAnchor, multiplier: 1).isActive = true
        cellLabelTrimNumber.heightAnchor.constraint(equalToConstant: 15).isActive = true

        if let firstStr1 =  recordModel.PropAndFieldVals?["P55"] as? String {
            if (recordModel.PropAndFieldVals?["P6"] as? String) != nil {
                let prefix = "/Date("
                let suffix = ")/"
                let scanner = Scanner(string: recordModel.PropAndFieldVals?["P6"] as! String)
                guard scanner.scanString(prefix, into: nil)  else { return  }
                var milliseconds : Int64 = 0
                guard scanner.scanInt64(&milliseconds) else { return  }
        // Milliseconds to seconds:
                var timeStamp = TimeInterval(milliseconds)/1000.0
        // Read optional timezone part:
                var timeZoneOffset : Int = 0
                if scanner.scanInt(&timeZoneOffset) {
                    let hours = timeZoneOffset / 100
                    let minutes = timeZoneOffset % 100
            // Adjust timestamp according to timezone:
                    timeStamp += TimeInterval(3600 * hours + 60 * minutes)
                }
        
                guard scanner.scanString(suffix, into: nil) else { return  }
        
                let newDate = NSDate(timeIntervalSince1970: timeStamp as TimeInterval)
                cellLabelCreatedBy.text = "Created By \(firstStr1) on \(dateTime(date: newDate as Date))"
            }
        }
       
        cellLabelCreatedBy.contentMode = .scaleAspectFill
        cellLabelCreatedBy.clipsToBounds = true
        cellLabelCreatedBy.backgroundColor = .white
        contentView.addSubview(cellLabelCreatedBy)
        cellLabelCreatedBy.translatesAutoresizingMaskIntoConstraints = false
        cellLabelCreatedBy.leftAnchor.constraint(equalTo: cellLabel.leftAnchor).isActive = true
        cellLabelCreatedBy.topAnchor.constraint(equalTo: cellLabelTrimNumber.bottomAnchor).isActive = true
        cellLabelCreatedBy.widthAnchor.constraint(equalTo: cellLabel.widthAnchor, multiplier: 1).isActive = true
        cellLabelCreatedBy.heightAnchor.constraint(equalToConstant: 15).isActive = true

    }
    
    func dateTime(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy" // - hh:mm a"
        return dateFormatter.string(from: date as Date)
    }
    
    override func prepareForReuse() {
        cellLabel.text = nil
        cellImage.image = nil
        cellImage2.image = nil
        cellLabelTrimNumber.text = nil
        cellLabelCreatedBy.text = nil
        cellImageInfo.image = nil
    }
    
 }
