//
//  MenuBar.swift
//  goCM
//
//  Created by Arturo Plottier on 16/8/17.
//  Copyright © 2017 pac-apps. All rights reserved.
//

import UIKit

class Home: NSObject {
    let imageName: String
    let homeName: String
    
    init( imageName: String, homeName: String) {
        self.imageName = imageName
        self.homeName = homeName
    }
    
}


class HomeMenuBar: UIView {
    var homeLauncher: HomeLauncher?
    
    let imageViewLeftArrow :UIButton = {
        let iv = UIButton() //(frame: CGRect(x: 0, y: 0, width: 22, height: 22)) // UIButton(image: UIImage(named: "gotrim")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMore))
        iv.addTarget(self, action: #selector(leftArrow), for: .touchUpInside)
        iv.setImage(UIImage(named: "leftarrow"), for: .normal)
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .clear
        iv.tintColor = UIColor.rgb(91, green: 14, blue: 13)
        return iv
    }()
    
    let imageView :UIButton = {
        let iv = UIButton() //(frame: CGRect(x: 0, y: 0, width: 22, height: 22)) // UIButton(image: UIImage(named: "gotrim")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMore))
        iv.addTarget(self, action: #selector(settingsView), for: .touchUpInside)
        iv.setImage(UIImage(named: "gear"), for: .normal)
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .clear
        iv.tintColor = UIColor.rgb(91, green: 14, blue: 13)
        return iv
    }()
    
    let homelbl: UILabel = {
        let lbl =  UILabel() //frame: CGRect(x: 0, y: 0, width: frame.width , height: frame.height))
        lbl.text = "goTRIM Home"
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
        
        
        // imageView.translatesAutoresizingMaskIntoConstraints = false
        // imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        // imageView.contentHorizontalAlignment = .left
        // imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        //  imageView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 1).isActive = true
        
        
        addSubview(imageViewLeftArrow)
        addConstraintsWithFormat( "H:|-10-[v0]", views: imageViewLeftArrow)
        addConstraintsWithFormat( "V:[v0(22)]-8-|", views: imageViewLeftArrow)

        
        addSubview(homelbl)
        addConstraintsWithFormat( "H:|[v0]|", views: homelbl)
        addConstraintsWithFormat( "V:[v0(22)]-8-|", views: homelbl)
        
        addSubview(imageView)
        addConstraintsWithFormat( "H:[v0(22)]-10-|", views: imageView)
        addConstraintsWithFormat( "V:[v0(22)]-8-|", views: imageView)
        
        
        // addConstraintsWithFormat("H:|-10-[v0(22)]-10-[v1]-10-|", views: imageView, settingslbl)
    }
    
 //   var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
    
    
    func settingsView() {
        homeLauncher?.showControllerForSetting()

    }
    func leftArrow() {
        homeLauncher?.showDocumentView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//class Home: NSObject {
//    let imageName: String
//    
//    init( imageName: String) {
//        self.imageName = imageName
//    }
//}
//
//
//class HomeMenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//    
//    lazy var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.backgroundColor =  GlobalVars.instance.GlobalBackgroundColor() //UIColor.rgb(215, green: 230, blue: 239)
//        cv.dataSource = self
//        cv.delegate = self
//        return cv
//    }()
//    
//    let cellId = "cellId"
//    let home: [Home] = {
//        return [Home( imageName: "leftarrow"),  Home(imageName: "gear")]
//    }()
//
//    var homeLauncher: HomeLauncher?
//   // var mainViewController: MainViewController?
//   /* lazy var homeLauncher: HomeLauncher = {
//        let launcher = HomeLauncher()
//        launcher.menuBar = self
//        return launcher
//    }()*/
//
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//               
//        collectionView.register(HomeMenuCell.self, forCellWithReuseIdentifier: cellId)
//        
//        addSubview(collectionView)
//        addConstraintsWithFormat( "H:|[v0]|", views: collectionView)
//        addConstraintsWithFormat( "V:|[v0]|", views: collectionView)
//        
//       // let selectedIndexPath = IndexPath(item: 0, section: 0)
//       // collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: UICollectionViewScrollPosition())
//    }
//    
//      
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return home.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeMenuCell
//        
//        let home = self.home[indexPath.item]
//        cell.home =  home //UIImage(named: home.imageName)?.withRenderingMode(.alwaysTemplate)
//        
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: frame.width / CGFloat(home.count), height: frame.height)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let menuItem = home[indexPath.item]
//        print(menuItem.imageName)
//        homeLauncher?.showControllerForSetting(menuItem)
//        
//     }
//
//   
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//}
//
//
//class HomeMenuCell: BaseCell {
//    
//    var imageView :UIImageView = {
//        let iv = UIImageView()
//        iv.contentMode = .scaleAspectFit
//        iv.image = UIImage(named: "leftarrow")?.withRenderingMode(.alwaysTemplate)
//        iv.tintColor =  UIColor.rgb(91, green: 14, blue: 13)
//        iv.backgroundColor = .clear
//        return iv
//    }()
// /*
//    override var isHighlighted: Bool {
//        didSet {
//            imageView.tintColor = isHighlighted ? UIColor.white : UIColor.rgb(91, green: 14, blue: 13)
//        }
//    }
// */
//    override var isSelected: Bool {
//        didSet {
//           // imageView.tintColor = isSelected ? UIColor.white : UIColor.rgb(91, green: 14, blue: 13)
//           // let selectedIndexPath = IndexPath(item: 0, section: 0)
//           // collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: UICollectionViewScrollPosition())
//        }
//    }
//    
//    var home: Home? {
//        didSet {
//            if let imageName = home?.imageName {
//                imageView.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
//               // imageView.tintColor = UIColor.darkGray
//            }
//        }
//
//    }
//    
//    override func setupViews() {
//        super.setupViews()
//        imageView.contentMode = .scaleAspectFit
//        addSubview(imageView)
//        addConstraintsWithFormat( "H:[v0(22)]", views: imageView)
//        addConstraintsWithFormat( "V:[v0(22)]-8-|", views: imageView)
//        
//        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
//        //addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
//    }
//    
//}
//
