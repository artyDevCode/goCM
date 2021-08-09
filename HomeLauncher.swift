//
//  HomeLauncher.swift
//  goCM
//
//  Created by Arturo Plottier on 19/8/17.
//  Copyright © 2017 pac-apps. All rights reserved.
//

import UIKit
import CoreData

class HomeLauncher : NSObject
{
    let mainCollectionView = UIView()
    let backBtn = UIButton()
    let settingsBtn = UIButton()
    let searchBar = UISearchBar()
    var rightAnchor: NSLayoutConstraint!
    var settingsVC: SettingsLauncher?
    var recordModel = [RecordModel]()
    var isLoadingMore = true

    // Pre-Fetching Queue
//    fileprivate let imageLoadQueue = OperationQueue()
//    fileprivate var imageLoadOperations =  self.getRecordsFromServer()
    
    let blackView = UIView()
    var isHidden: Bool = false
    var settingsConnection = SettingsConnection()

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isPrefetchingEnabled = true
        cv.backgroundColor = UIColor.rgb(215, green: 230, blue: 239) //UIColor.white
        cv.contentInset = UIEdgeInsetsMake(3, 0, 0, 0)
        cv.scrollIndicatorInsets = UIEdgeInsetsMake(3, 0, 0, 0)
        return cv
    }()

    lazy var menuBar: HomeMenuBar = {
        let mb = HomeMenuBar()
        mb.homeLauncher = self
        return mb
    }()
    
    lazy var docMenuBar: DocumentMenuBar = {
        let mb = DocumentMenuBar()
        mb.homeLauncher = self
        return mb
    }()

    var documentController: DocumentViewController?
    
    
    lazy var settingsLauncher: SettingsLauncher = {
        let launcher = SettingsLauncher()
        launcher.homeLauncher = self
        return launcher
    }()
    
    lazy var connectionLauncher: ConnectionLauncher = {
        let launcher = ConnectionLauncher()
        launcher.homeLauncher = self
        return launcher
    }()

   
    
    func ShowUI() {
        self.isHidden = true
        fetchData()
    }


    func fetchData() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        CoreDataHelper.instance.getCoreDataSettings {
            (response) in
            if (response == nil) {
                if  let window = UIApplication.shared.keyWindow {
                    self.mainCollectionView.frame = CGRect(x: -320, y: 0, width: 0, height: window.frame.height ) //width: self.view.frame.width / 2
                    self.blackView.backgroundColor = UIColor(white: 0, alpha: 0.0)
                    self.blackView.alpha = 0
                    self.connectionLauncher.showSettingsUI()
                }
                
            }
            else {
                for setConnection in response! {
                    if setConnection.boolDefault
                    {
                        self.settingsConnection = setConnection
                    }
                    
                    print("setConnection=  \(setConnection.boolDefault)" )
                }

                NetworkService.instance.httpRequestConnection(settingsConnection: self.settingsConnection, httpAdditionalString: "&a=sp") {
                    (response) in
                    print("response - \(response)")
                    //DisplayMessage.instance.showMessage(message: "Successfully Connected to the Server", color: .blue)
                    
                    NetworkService.instance.httpRequests (settingsConnection: self.settingsConnection, httpAdditionalString: "&pi=10&a=gc&t=0&u=0"){
                        (response) in
                        self.recordModel = response.recordCollection.Data! // response.recordModel
                        
                        //                    if (self.recordModel[0].PropAndFieldVals?.count)! > 0 {
                        //                        self.collectionView.register(DetailViewCell.self, forCellWithReuseIdentifier: "DetailListCell")
                        //                    }
                        //                    else
                        //                    {
                        //                       self.collectionView.register(FirstViewCell.self, forCellWithReuseIdentifier: "FirstListCell")
                        //                    }
                        self.collectionView.register(DetailViewCell.self, forCellWithReuseIdentifier: "DetailListCell")
                        self.collectionView.register(FirstViewCell.self, forCellWithReuseIdentifier: "FirstListCell")
                        
                        
                        DispatchQueue.main.async(execute: {
                           // DispatchQueue.main.async(execute: self.collectionView.reloadData)
                            self.collectionView.reloadData()
                            
                            if let window = UIApplication.shared.keyWindow {
                                
                                self.blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
                                
                                self.blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismiss)))
                                
                                window.addSubview(self.blackView)
                                self.mainCollectionView.alpha = 1
                                
                                self.blackView.frame = window.frame
                                self.blackView.alpha = 0
                                self.setupMenuBar()
                                self.setSearchBar()
                                
                                window.addSubview(self.mainCollectionView)
                                self.mainCollectionView.frame = CGRect(x: -320, y: 0, width: 0, height: window.frame.height) //width: self.view.frame.width / 2
                                self.mainCollectionView.addSubview(self.collectionView)
                                self.mainCollectionView.addConstraintsWithFormat( "H:|[v0]|", views: self.collectionView)
                                self.mainCollectionView.addConstraintsWithFormat( "V:|-107-[v0]|", views: self.collectionView)
                                
                                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear , animations: {
                                    self.blackView.alpha = 1
                                    self.mainCollectionView.frame = CGRect(x: 0, y: 0, width: 320, height: window.frame.height) //width: self.view.frame.width / 2
                                }, completion: nil)
                            }
                        })
                    }
                }
            }
        }
    }


    func getRecordsFromServer(itemType: Int64, uri: Int64) {   //a=gc&t=0&u=0&pi=0&p=50&s=P26&o=0 main menu 2)a=gc&t=-1&pi=0&ps=50&s=P26&o=0 3)reload a=gc&t=-1&u=-1&pi=0&ps=50&s=P26&o=0
        NetworkService.instance.httpRequests (settingsConnection: self.settingsConnection, httpAdditionalString: "&a=gc&t=\(itemType)&u=\(uri)&pi=\(recordModel.count)"){ // Recent Documents t=-1&u=-1
            (response) in
            self.isLoadingMore = true
            self.recordModel = response.recordCollection.Data! // response.recordModel
            //DispatchQueue.main.async(execute: self.collectionView.reloadData)
            self.collectionView.reloadData()
            self.isLoadingMore = false
        }
    }
    
    
    func handleDismiss() {
        self.isHidden = false
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear , animations: {
            //self.mainCollectionView.alpha = 0
            self.blackView.alpha = 1

            if let window = UIApplication.shared.keyWindow {
                if self.isHidden  {
                   // self.mainCollectionView.frame = CGRect(x: 0, y: 0, width: 320, height: window.frame.height)
                  //   self.blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
                }
                else {
                    //self.blackView.frame = CGRect(x: 0, y: 0, width: 0, height: window.frame.height)
                    self.mainCollectionView.frame = CGRect(x: -320, y: 0, width: 0, height: window.frame.height) //width: self.view.frame.width / 2
                    self.blackView.backgroundColor = UIColor(white: 0, alpha: 0.0)
                    self.blackView.alpha = 0
                }
            }
        })
    }
    
    func showDocumentView() {
        handleDismiss()
        self.documentController?.showDocumentUI()

    }

    func showControllerForSetting() {
//            if let window = UIApplication.shared.keyWindow {
//                    self.mainCollectionView.frame = CGRect(x: -320, y: 0, width: 0, height: window.frame.height ) //width: self.view.frame.width / 2
//                    self.blackView.backgroundColor = UIColor(white: 0, alpha: 0.0)
//                    self.blackView.alpha = 0
//                    settingsLauncher.showSettingsUI()
//            }
        handleDismiss()
        settingsLauncher.showSettingsUI()

    }

    
//    func showControllerForSetting(_ setting: Home) {
//        if setting.imageName == "gear" {
//           // handleDismiss()
//            if let window = UIApplication.shared.keyWindow {
//                self.mainCollectionView.frame = CGRect(x: -320, y: 0, width: 0, height: window.frame.height ) //width: self.view.frame.width / 2
//                self.blackView.backgroundColor = UIColor(white: 0, alpha: 0.0)
//                self.blackView.alpha = 0
//                settingsLauncher.showSettingsUI()
//            }
//        }
//        if setting.imageName == "leftarrow" {
//            self.isHidden = true
//            handleDismiss()
//        }
//        
//    }
    
    
    fileprivate func setupMenuBar() {
        mainCollectionView.addSubview(menuBar)
        mainCollectionView.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        mainCollectionView.addConstraintsWithFormat("V:|[v0(64)]", views: menuBar)
    }
    
    
    /*
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        
        collectionView = UICollectionView(frame: mainCollectionView.frame, collectionViewLayout: layout)
        //  collectionView.frame(forAlignmentRect: CGRect(x: 0, y: 64, width: 320, height: self.view.frame.height))
       // collectionView.register(DetailViewCell.self, forCellWithReuseIdentifier: "MainListCell")
        collectionView.backgroundColor = UIColor.rgb(215, green: 230, blue: 239) //UIColor.white
       // collectionView.delegate = self
       // collectionView.dataSource = self
        collectionView?.contentInset = UIEdgeInsetsMake(3, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(3, 0, 0, 0)
       
     //  mainCollectionView.addSubview(collectionView)
      //  mainCollectionView.addConstraintsWithFormat( "H:|[v0]|", views: collectionView)
      //  mainCollectionView.addConstraintsWithFormat( "V:|-107-[v0]|", views: collectionView)
        
    }
    */
      func setSearchBar() {
        // searchBar.frame = CGRect(x: 0, y: 0, width:self.view.frame.width, height: 32)
        searchBar.barTintColor = UIColor.rgb(171, green: 200, blue: 216) //UIColor.white
        // searchBar.backgroundColor = UIColor.lightGray
        searchBar.isTranslucent = true
        searchBar.placeholder = "Title, Notes or Record Number"
        searchBar.searchBarStyle = UISearchBarStyle.prominent
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        mainCollectionView.addSubview(searchBar)
        // mainCollectionView.addConstraintsWithFormat( "H:|[v0]|", views: searchBar)
        // mainCollectionView.addConstraintsWithFormat( "V:|-64-[v0(32)]", views: searchBar)
        
        NSLayoutConstraint(item: searchBar, attribute: .top, relatedBy: .equal, toItem: menuBar, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true
        //NSLayoutConstraint(item: searchBar, attribute: .bottom, relatedBy: .equal, toItem: collectionView, attribute: .top, multiplier: 1.0, constant: 64.0).isActive = true
        
        NSLayoutConstraint(item: searchBar, attribute: .left, relatedBy: .equal, toItem: mainCollectionView, attribute: .left, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: searchBar, attribute: .right, relatedBy: .equal, toItem: mainCollectionView, attribute: .right, multiplier: 1.0, constant: 0.0).isActive = true
        
        
        
    }
    
    func refresh(sender:AnyObject)
    {
       // self.getRecordsFromServer() //This should just reload the original first group of records
        refreshControl.endRefreshing()
    }

    
    func backAction() {
        //   MainConstraint.constant = -320
        //   SettingsConstraint.constant = -320
        print("MainViewController")
    }
    
     var refreshControl:UIRefreshControl!

     override init() {
        super.init()
         collectionView.bounces = true
        collectionView.alwaysBounceVertical = true
         self.refreshControl = UIRefreshControl()
         self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
         self.refreshControl.addTarget(self, action: #selector(refresh), for: UIControlEvents.valueChanged)
         collectionView.addSubview(refreshControl)
    }
    
  }

// MARK: UICollectionViewDataSourcePrefetching
//extension HomeLauncher: UICollectionViewDataSourcePrefetching {
//    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
//        for indexPath in indexPaths {
//            guard let recordMod = recordModel[indexPath.row] else { return }
//            self.getRecordsFromServer(itemType: recordMod.Id!.ItemType!, uri: recordMod.Id!.Uri!)
////            if let _ = imageLoadOperations[indexPath] {
////                return
////            }
////            if let viewModel = userViewModelController.viewModel(at: (indexPath as NSIndexPath).row) {
////                let imageLoadOperation = self.getRecordsFromServer
////                imageLoadQueue.addOperation(imageLoadOperation)
////                imageLoadOperations[indexPath] = imageLoadOperation
////            }
//            
//            #if DEBUG_CELL_LIFECYCLE
//                print(String.init(format: "prefetchItemsAt #%i", indexPath.row))
//            #endif
//        }
//    }
//}
//

extension HomeLauncher: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.collectionView.collectionViewLayout.invalidateLayout()
        return recordModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("items count = \(indexPath.item)")
         if (recordModel[indexPath.item].PropAndFieldVals?.count)! > 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailListCell", for: indexPath) as! DetailViewCell
            cell.configure(with: recordModel[indexPath.item])
            cell.backgroundColor = .white
            //cell.delegate = self as? DetailListColectionViewCellDelegate
            return cell
        }
         else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstListCell", for: indexPath) as! FirstViewCell
            cell.configure(with: recordModel[indexPath.item])
            cell.backgroundColor = .white
            //cell.delegate = self as? FirstListColectionViewCellDelegate
            return cell
        }
    }
    
      //Sets the size of the cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (recordModel[indexPath.item].PropAndFieldVals?.count)! > 0 {
            let data = recordModel[indexPath.item]
            let estimateHeight = NSString(string: (data.Title)!).boundingRect(with: CGSize(width: collectionView.frame.width - 100 , height: 1000), options: .usesLineFragmentOrigin ,
                                                                                    attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 12)], context: nil)
            
            return CGSize(width: 308, height: estimateHeight.height + 40) //(width: view.frame.width, height: 52)
           // return CGSize(width: 308, height: 50)
        }
        else {
            return CGSize(width: 308, height: 50) //(width: view.frame.width, height: 52)
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        if  indexPath.row == recordModel.count-1  && !isLoadingMore {
//            guard let recordMod = recordModel[indexPath.row] else { return }
//            self.getRecordsFromServer(itemType: recordMod.Id!.ItemType!, uri: recordMod.Id!.Uri!)
//        }
//    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        let cellItem = recordModel[indexPath.item]
    
        NetworkService.instance.httpRequests (settingsConnection: self.settingsConnection, httpAdditionalString: "&a=gc&t=\(Int64((cellItem.Id?.ItemType)!))&u=\(Int64((cellItem.Id?.Uri)!))"){
            (response) in
            self.recordModel = response.recordCollection.Data!
           // DispatchQueue.main.async(execute: self.collectionView.reloadData)
            collectionView.reloadData()
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
                print(indexPath)
            }, completion: nil)
        }
    }
}

//Cell clicked, do something
//extension HomeLauncher: DetailListColectionViewCellDelegate {
//    func changeDetailColorOfButton(forCell: DetailViewCell) {
//        //forCell.button.backgroundColor = UIColor.blue
//    }
//   }
//extension HomeLauncher: FirstListColectionViewCellDelegate {
//    
//    func changeFirstColorOfButton(forCell: FirstViewCell) {
//        //forCell.button.backgroundColor = UIColor.blue
//    }
//}

