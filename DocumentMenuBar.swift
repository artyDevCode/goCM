//
//  DocumentMenuBar.swift
//  goCM
//
//  Created by Arturo Plottier on 17/8/17.
//  Copyright © 2017 pac-apps. All rights reserved.
//

import UIKit

class DocumentMenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = GlobalVars.instance.GlobalBackgroundColor() // UIColor.rgb(215, green: 230, blue: 239)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let cellId = "cellId"
    let imageNames = ["note", "workflow", "checkout", "edit", "star", "download", "envelope", "openin", "info"]
   
    let leftMenuBarSettings : UIView = {
        let mbView = UIView()
        mbView.frame = CGRect(x: 0, y: 0, width:  UIScreen.main.bounds.width, height: 64)
        mbView.backgroundColor = GlobalVars.instance.GlobalBackgroundColor()
        return mbView
    }()
    
    
    let rightMenuBarSettings : UIView = {
        let mbView = UIView()
        mbView.frame = CGRect(x: UIScreen.main.bounds.width - 320, y: 0, width:  320, height: 64)
        mbView.backgroundColor = GlobalVars.instance.GlobalBackgroundColor()
        return mbView
    }()

    let gotrimBtn :UIButton = {
        let iv = UIButton() // UIButton(image: UIImage(named: "gotrim")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMore))
        iv.addTarget(self, action: #selector(handleMore), for: .touchUpInside)
        iv.setImage(UIImage(named: "gotrim"), for: .normal)
        iv.contentMode = .scaleAspectFit
        iv.tintColor = UIColor.rgb(91, green: 14, blue: 13)
        return iv
    }()
    
    var homeLauncher: HomeLauncher?
    var documentViewController : DocumentViewController?
    override init(frame: CGRect) {
        super.init(frame: frame)
        

      //  leftMenuBarSettings.translatesAutoresizingMaskIntoConstraints = false
       // rightMenuBarSettings.translatesAutoresizingMaskIntoConstraints = false

        addSubview(leftMenuBarSettings)
        // NSLayoutConstraint(item: leftMenuBarSettings, attribute: .right, relatedBy: .equal, toItem: rightMenuBarSettings, attribute: .left, multiplier: 1.0, constant: 0.0).isActive = true
        
        // leftMenuBarSettings.rightAnchor.constraint(equalTo: rightMenuBarSettings.leftAnchor)
        addConstraintsWithFormat( "H:|[v0]|", views: leftMenuBarSettings)
        addConstraintsWithFormat( "V:|[v0(64)]", views: leftMenuBarSettings)

        
        addSubview(rightMenuBarSettings)
        addConstraintsWithFormat( "H:[v0(400)]|", views: rightMenuBarSettings)
        //NSLayoutConstraint(item: rightMenuBarSettings, attribute: .right, relatedBy: .equal, toItem: self.widthAnchor, attribute: .right, multiplier: 1.0, constant: 1/2).isActive = true
        addConstraintsWithFormat( "V:|[v0(64)]", views: rightMenuBarSettings)
        
       
        
        leftMenuBarSettings.addSubview(gotrimBtn)
        addConstraintsWithFormat( "H:|-10-[v0(22)]", views: gotrimBtn)
        addConstraintsWithFormat( "V:[v0(22)]-8-|", views: gotrimBtn)
        
        rightMenuBarSettings.addSubview(collectionView)
        addConstraintsWithFormat( "H:[v0(400)]|", views: collectionView)
        addConstraintsWithFormat( "V:|[v0]|", views: collectionView)

        
               //leftMenuBarSettings.rightAnchor.constraint(equalTo: rightMenuBarSettings.leftAnchor)
        //rightMenuBarSettings.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2)
               /*
        addSubview(gotrimBtn)
        addConstraintsWithFormat( "H:|-10-[v0(22)]", views: gotrimBtn)
        addConstraintsWithFormat( "V:[v0(22)]-8-|", views: gotrimBtn)
        
        addSubview(collectionView)
        addConstraintsWithFormat( "H:[v0(400)]|", views: collectionView)
        addConstraintsWithFormat( "V:|[v0]|", views: collectionView)
        */

        
        ////addConstraintsWithFormat( "H:|-8-[v0(24)]-8-[v1(200)]-[v2(24)]-8-|", views: cellDefaultConnImage, cellLabel,cellEditConnImage)
        //addConstraintsWithFormat( "H:|[v0]|", views: rightMenuBarSettings) // "H:|-10-[v0(22)]-[v1(300)]|", views: leftMenuBarSettings, rightMenuBarSettings)
        //addConstraintsWithFormat( "V:|[v0]|", views: rightMenuBarSettings)
        collectionView.register(DocumentMenuCell.self, forCellWithReuseIdentifier: cellId)

        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: UICollectionViewScrollPosition())
    }
    
    func handleMore() {
        //self.homeLauncher?.handleDismiss()
     //   self.homeLauncher?.ShowUI()
        self.documentViewController?.showHomeLuncherUI()
        print("gotrim btn")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
      //  let x = CGFloat(indexPath.item) * frame.width / 4
       // horizontalBarLeftAnchorConstraint?.constant = x
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DocumentMenuCell
        
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
       // cell.tintColor = .white //UIColor.rgb(91, green: 14, blue: 13)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 40, height: frame.height) //CGSize(width: (frame.width / 2) / CGFloat(imageNames.count) , height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class DocumentMenuCell: BaseCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "info")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = UIColor.rgb(91, green: 14, blue: 13)
        return iv
    }()
    /*
    override var isHighlighted: Bool {
        didSet {
            imageView.tintColor = isHighlighted ? UIColor.white : UIColor.rgb(91, green: 14, blue: 13)
        }
    }
    */
    override var isSelected: Bool {
        didSet {
            imageView.tintColor = isSelected ? UIColor.white : UIColor.rgb(91, green: 14, blue: 13)
            print("selected")
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(imageView)
        addConstraintsWithFormat( "H:[v0(22)]", views: imageView)
        addConstraintsWithFormat( "V:[v0(22)]-8-|", views: imageView)
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        //addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
}
