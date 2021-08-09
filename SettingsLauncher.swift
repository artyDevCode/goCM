//
//  SettingsLauncher.swift
//  goCM
//
//  Created by Arturo Plottier on 21/8/17.
//  Copyright © 2017 pac-apps. All rights reserved.
//

import UIKit
import CoreData

class SettingsLauncher : NSObject {
    var backBtnCons: [NSLayoutConstraint] = []
    
   
    var ConnectionConstraint: NSLayoutConstraint!
    var SettingsConstraint: NSLayoutConstraint!
    var MainConstraint: NSLayoutConstraint!
   // var collectionView: UICollectionView!
//    let settingsConnection: [settingsConnection] = [settingsConnection(
//        textConnection : "abc",
//        textGateway : "123",
//        boolHTTPS : true,
//        boolValidateSSL : true,
//        textPort : "80",
//        textUserName : "arty",
//        textPassword : "sdfsdf",
//        textDomain : "localhost",
//        boolBasicAuth : true,
//        textJSONTimeout : "60",
//        textFileTimeout : "30",
//        textPageSize : "25",
//        textSortField : "ascending",
//        textSortOrder : "1" )]
    
    var settingsConnection = [SettingsConnection]()
    
    let settingsView = UIView()
    let blackView = UIView()
    
    
    lazy var settingsMenuBar: SettingsMenuBar = {
        let launcher = SettingsMenuBar()
        launcher.settingsLauncher = self
        return launcher
    }()
    
    var homeLauncher: HomeLauncher?
    
    lazy var connectionLauncher: ConnectionLauncher = {
        let launcher = ConnectionLauncher()
        launcher.settingsLauncher = self
        return launcher
    }()


    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        let cv = UICollectionView(frame: .zero , collectionViewLayout: layout)
        cv.isPrefetchingEnabled = false
        cv.backgroundColor = .white // UIColor.rgb(215, green: 230, blue: 239) //UIColor.white
        cv.contentInset = UIEdgeInsetsMake(3, 0, 0, 0)
        cv.scrollIndicatorInsets = UIEdgeInsetsMake(3, 0, 0, 0)
        return cv
    }()

 
    override init() {
        super.init()
        
//        collectionView.register(SettingsViewCell.self, forCellWithReuseIdentifier: "SettingsListCell")
//        collectionView.delegate = self
//        collectionView.dataSource = self
    }
    
    let collectionLabel = UILabel()
    let addConnButton = UIButton()
    let versionlbl =  UILabel()
    let passcodelbl =  UILabel()
    let PassCodeOnBtn = UIButton()
    let ChngPassCodeBtn = UIButton()
    let baselbl =  UILabel()
    let clientVerlbl =  UILabel()
    let clientVerlblRes =  UILabel()

       
    func showSettingsUI() {
        collectionView.register(SettingsViewCell.self, forCellWithReuseIdentifier: "SettingsListCell")
        collectionView.delegate = self
        collectionView.dataSource = self

        CoreDataHelper.instance.getCoreDataSettings {
            (response) in
            if ((response?.count)! == 0) {
                self.addNewConnection()
            }
            else {
                self.settingsConnection = response!
                if let window = UIApplication.shared.keyWindow {
                    
                    self.blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
                    
                    self.blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismiss)))
                    self.blackView.frame = window.frame
                    window.addSubview(self.blackView)
                    
                    //            let fetchRequest: NSFetchRequest<SettingsConnection> = SettingsConnection.fetchRequest()
                    //
                    //            do {
                    //            let settingsConnection = try PersistenceService.context.fetch(fetchRequest)
                    //                self.settingsConnection = settingsConnection
                    //                self.collectionView.reloadData()
                    //            }
                    //            catch {}
                    
                    window.addSubview(self.settingsView)
                    self.settingsView.frame = CGRect(x: -320, y: 0, width: 0, height: window.frame.height)
                    self.settingsView.backgroundColor = .white
                    
                    self.setupMenuBar()
                    self.setCollectionTitle()
                    self.settingsView.addSubview(self.collectionView)
                    
                    self.collectionView.translatesAutoresizingMaskIntoConstraints = false
                    self.collectionView.topAnchor.constraint(equalTo: self.collectionLabel.bottomAnchor).isActive = true
                    self.collectionView.widthAnchor.constraint(equalTo: self.settingsView.widthAnchor , multiplier: 1).isActive = true
                    self.collectionView.heightAnchor.constraint(equalToConstant:  CGFloat(self.settingsConnection.count * 50)).isActive = true

                    print("collection cell count = \(self.settingsConnection.count * 50)")
                    // DispatchQueue.main.async(execute: self.collectionView.reloadData)
                    self.setupAddConnButton()
                    self.setupPasscode()
                    self.setupDisplayVer()
                    
                    
                    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear , animations: {
                        self.collectionView.reloadData()
                        //DispatchQueue.main.async(execute: self.collectionView.reloadData)
                        self.blackView.alpha = 1
                        self.settingsView.frame = CGRect(x: 0, y: 0, width: 320, height: window.frame.height)
                    }, completion: nil)
                    
                }

            }
        }

    }
    
    fileprivate func setupMenuBar() {
        settingsView.addSubview(settingsMenuBar)
        settingsView.addConstraintsWithFormat("H:|[v0]|", views: settingsMenuBar)
        settingsView.addConstraintsWithFormat("V:|[v0(64)]", views: settingsMenuBar)

//        self.settingsMenuBar.translatesAutoresizingMaskIntoConstraints = false
//        self.settingsMenuBar.topAnchor.constraint(equalTo: settingsView.topAnchor).isActive = true
//        self.settingsMenuBar.widthAnchor.constraint(equalTo: self.settingsView.widthAnchor, multiplier: 1).isActive = true
//        self.settingsMenuBar.heightAnchor.constraint(equalToConstant: 64).isActive = true


    }

    func setCollectionTitle() {
       // collectionLabel.frame.origin.y = settingsView.frame.height - settingsView.frame.height
        collectionLabel.backgroundColor = .white
        collectionLabel.text = "   Server Configuration"
        collectionLabel.textColor = UIColor.rgb(91, green: 14, blue: 13)
        collectionLabel.textAlignment = .left
        settingsView.addSubview(collectionLabel)
        collectionLabel.translatesAutoresizingMaskIntoConstraints = false
       // settingsView.addConstraintsWithFormat( "H:|-10-[v0]", views: collectionLabel)
        collectionLabel.topAnchor.constraint(equalTo: settingsMenuBar.bottomAnchor).isActive = true
        collectionLabel.widthAnchor.constraint(equalTo: settingsView.widthAnchor, multiplier: 1).isActive = true
        collectionLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    func setupAddConnButton() {
        addConnButton.center.x = settingsView.center.x
        addConnButton.backgroundColor = .white
        addConnButton.setTitle("Add New Connection", for: .normal)
        addConnButton.setTitleColor(UIColor.rgb(91, green: 14, blue: 13), for: .normal)
        addConnButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.addNewConnection)))
       // button.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
        settingsView.addSubview(addConnButton)
        addConnButton.translatesAutoresizingMaskIntoConstraints = false
        addConnButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive = true
        addConnButton.widthAnchor.constraint(equalTo: settingsView.widthAnchor, multiplier: 1).isActive = true
        addConnButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        //button.heightAnchor.constraint(equalToConstant: 10).isActive = true

     //   settingsView.addConstraintsWithFormat("H:|[v0]|", views: button)
     //   settingsView.addConstraintsWithFormat("V:|[v0(420)]", views: button)

    }
    func addNewConnection() {
        print("show settings config")
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear , animations: {
            self.blackView.alpha = 0
            
            if let window = UIApplication.shared.keyWindow {
                self.settingsView.frame = CGRect(x: -320, y: 0, width: 0, height: window.frame.height) //width: self.view.frame.width / 2
                self.blackView.backgroundColor = UIColor(white: 0, alpha: 0.0)
                self.blackView.alpha = 0
            }
            
        }) { (completed: Bool) in
            self.connectionLauncher.showSettingsUI()
        }
        
    }
    
    func handleDismiss() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear , animations: {
            self.blackView.alpha = 0
            
            if let window = UIApplication.shared.keyWindow {
                self.settingsView.frame = CGRect(x: -320, y: 0, width: 0, height: window.frame.height) //width: self.view.frame.width / 2
                self.blackView.backgroundColor = UIColor(white: 0, alpha: 0.0)
                self.blackView.alpha = 0
            }
            
        }) { (completed: Bool) in
            self.homeLauncher?.ShowUI()
        }

    }
    
    
    
    func setupPasscode() {
        passcodelbl.text = "   Passcode"
        passcodelbl.textAlignment = .left
        passcodelbl.backgroundColor = .white
        passcodelbl.font = UIFont.systemFont(ofSize: 20)
        passcodelbl.textColor = UIColor.rgb(91, green: 14, blue: 13)
        settingsView.addSubview(passcodelbl)
        passcodelbl.translatesAutoresizingMaskIntoConstraints = false
       // settingsView.addConstraintsWithFormat( "H:|-10-[v0]|", views: passcodelbl)
        passcodelbl.heightAnchor.constraint(equalToConstant: 70).isActive = true
        passcodelbl.topAnchor.constraint(equalTo: addConnButton.bottomAnchor).isActive = true
        passcodelbl.widthAnchor.constraint(equalTo: settingsView.widthAnchor, multiplier: 1).isActive = true

      //  passcodelbl(equalTo: settingsView.widthAnchor, multiplier: 1).isActive = true
        
       // PassCodeOnBtn.center.x = settingsView.center.x
        PassCodeOnBtn.backgroundColor = .white
        PassCodeOnBtn.titleLabel?.textAlignment = .center
        PassCodeOnBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        PassCodeOnBtn.setTitle("Turn Passcode On", for: .normal)
        PassCodeOnBtn.setTitleColor(UIColor.rgb(91, green: 14, blue: 13), for: .normal)
        settingsView.addSubview(PassCodeOnBtn)
        // PassCodeOnBtn.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
        PassCodeOnBtn.translatesAutoresizingMaskIntoConstraints = false
        PassCodeOnBtn.topAnchor.constraint(equalTo: passcodelbl.bottomAnchor).isActive = true
        PassCodeOnBtn.widthAnchor.constraint(equalTo: settingsView.widthAnchor, multiplier: 1).isActive = true
        PassCodeOnBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true


//        settingsView.addSubview(versionlbl)
//        settingsView.addConstraintsWithFormat( "H:|[v0]|", views: PassCodeOnBtn)
//        settingsView.addConstraintsWithFormat( "V:|[v0]|", views: PassCodeOnBtn)
        
      //  ChngPassCodeBtn.center.x = settingsView.center.x
        ChngPassCodeBtn.backgroundColor = .white
        ChngPassCodeBtn.setTitle("Change Passcode ", for: .normal)
        ChngPassCodeBtn.titleLabel?.textAlignment = .center
        ChngPassCodeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        ChngPassCodeBtn.setTitleColor(UIColor.rgb(91, green: 14, blue: 13), for: .normal)
        // button.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
        settingsView.addSubview(ChngPassCodeBtn)
        ChngPassCodeBtn.translatesAutoresizingMaskIntoConstraints = false
        ChngPassCodeBtn.topAnchor.constraint(equalTo: PassCodeOnBtn.bottomAnchor).isActive = true
        ChngPassCodeBtn.widthAnchor.constraint(equalTo: settingsView.widthAnchor, multiplier: 1).isActive = true
        ChngPassCodeBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true

//        settingsView.addConstraintsWithFormat( "H:|[v0]|", views: ChngPassCodeBtn)
//        settingsView.addConstraintsWithFormat( "V:|[v0]|", views: ChngPassCodeBtn)
    }
    
    func setupDisplayVer() {
        
        let versionlbl =  UILabel()
        versionlbl.text = "   Version"
        versionlbl.backgroundColor = .white
        versionlbl.textAlignment = .left
        versionlbl.font = UIFont.systemFont(ofSize: 20)
        versionlbl.textColor = UIColor.rgb(91, green: 14, blue: 13)
        settingsView.addSubview(versionlbl)
        versionlbl.translatesAutoresizingMaskIntoConstraints = false
        versionlbl.topAnchor.constraint(equalTo: ChngPassCodeBtn.bottomAnchor).isActive = true
        versionlbl.heightAnchor.constraint(equalToConstant: 50).isActive = true
        versionlbl.widthAnchor.constraint(equalTo: settingsView.widthAnchor, multiplier: 1).isActive = true

        
        //Client Version label and result
      
        baselbl.textColor = .gray
        settingsView.addSubview(baselbl)

        
        baselbl.widthAnchor.constraint(equalTo: settingsView.widthAnchor, multiplier: 1).isActive = true
        baselbl.translatesAutoresizingMaskIntoConstraints = false
        baselbl.topAnchor.constraint(equalTo: versionlbl.bottomAnchor).isActive = true
        baselbl.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        clientVerlbl.text = "   Client Version: "
        clientVerlbl.textAlignment = .left
        clientVerlbl.font = UIFont.systemFont(ofSize: 12)
        clientVerlbl.textColor = .gray
        baselbl.addSubview(clientVerlbl)
        clientVerlbl.translatesAutoresizingMaskIntoConstraints = false
        clientVerlbl.widthAnchor.constraint(equalTo: baselbl.widthAnchor, multiplier: 1).isActive = true
        clientVerlbl.topAnchor.constraint(equalTo: baselbl.topAnchor).isActive = true
        clientVerlbl.heightAnchor.constraint(equalToConstant: 25).isActive = true
        clientVerlbl.leftAnchor.constraint(equalTo: baselbl.leftAnchor)
        
        clientVerlblRes.backgroundColor = .clear
        clientVerlblRes.font = UIFont.systemFont(ofSize: 12)
        clientVerlblRes.text = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String //"*********"
        baselbl.addSubview(clientVerlblRes)
        clientVerlblRes.widthAnchor.constraint(equalTo: baselbl.widthAnchor, multiplier: 1).isActive = true
        clientVerlblRes.translatesAutoresizingMaskIntoConstraints = false
        clientVerlblRes.heightAnchor.constraint(equalToConstant: 25).isActive = true
        clientVerlblRes.topAnchor.constraint(equalTo: baselbl.topAnchor).isActive = true
        baselbl.addConstraintsWithFormat( "H:|-120-[v0]", views: clientVerlblRes)

        let baselbl1 =  UILabel()
        let clientVerlbl1 =  UILabel()
        let clientVerlblRes1 =  UILabel()
        
        baselbl1.textColor = .gray
        settingsView.addSubview(baselbl1)
        baselbl1.widthAnchor.constraint(equalTo: settingsView.widthAnchor, multiplier: 1).isActive = true
        baselbl1.translatesAutoresizingMaskIntoConstraints = false
        baselbl1.topAnchor.constraint(equalTo: baselbl.bottomAnchor).isActive = true
        baselbl1.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        clientVerlbl1.text = "   Server Version:  "
        clientVerlbl1.textAlignment = .left
        clientVerlbl1.font = UIFont.systemFont(ofSize: 12)
        clientVerlbl1.textColor = .gray
        baselbl1.addSubview(clientVerlbl1)
        clientVerlbl1.translatesAutoresizingMaskIntoConstraints = false
        clientVerlbl1.widthAnchor.constraint(equalTo: baselbl1.widthAnchor, multiplier: 1).isActive = true
        clientVerlbl1.topAnchor.constraint(equalTo: baselbl1.topAnchor).isActive = true
        clientVerlbl1.heightAnchor.constraint(equalToConstant: 25).isActive = true
        clientVerlbl1.leftAnchor.constraint(equalTo: baselbl1.leftAnchor)
        
        clientVerlblRes1.backgroundColor = .clear
        clientVerlblRes1.font = UIFont.systemFont(ofSize: 12)
        clientVerlblRes1.text = GlobalArrays.requestConnectionModel.goTRIMVer // "*********"
        baselbl1.addSubview(clientVerlblRes1)
        clientVerlblRes1.widthAnchor.constraint(equalTo: baselbl1.widthAnchor, multiplier: 1).isActive = true
        clientVerlblRes1.translatesAutoresizingMaskIntoConstraints = false
        clientVerlblRes1.heightAnchor.constraint(equalToConstant: 25).isActive = true
        clientVerlblRes1.topAnchor.constraint(equalTo: baselbl1.topAnchor).isActive = true
        baselbl1.addConstraintsWithFormat( "H:|-120-[v0]", views: clientVerlblRes1)
        

        
        
//        //Server version and result
//        let serverVerlbl =  UILabel()
//        serverVerlbl.text = "Server Version: "
//        serverVerlbl.backgroundColor = .white
//        serverVerlbl.textAlignment = .left
//        serverVerlbl.font = UIFont.systemFont(ofSize: 12)
//        serverVerlbl.textColor = UIColor.rgb(91, green: 14, blue: 13)
//        serverVerlbl.sizeToFit()
//        settingsView.addSubview(serverVerlbl)
//        serverVerlbl.translatesAutoresizingMaskIntoConstraints = false
//        settingsView.addConstraintsWithFormat( "H:|-10-[v0]", views: serverVerlbl)
//        serverVerlbl.topAnchor.constraint(equalTo: baselbl.bottomAnchor).isActive = true
//        
//        let serverVerlblRes =  UILabel()
//        serverVerlblRes.text = "********"
//        serverVerlblRes.backgroundColor = .white
//        serverVerlblRes.textAlignment = .left
//        serverVerlblRes.font = UIFont.systemFont(ofSize: 12)
//        serverVerlblRes.textColor = UIColor.rgb(91, green: 14, blue: 13)
//        serverVerlblRes.sizeToFit()
//        settingsView.addSubview(serverVerlblRes)
//        serverVerlblRes.translatesAutoresizingMaskIntoConstraints = false
//        serverVerlblRes.topAnchor.constraint(equalTo: baselbl.bottomAnchor).isActive = true
//        serverVerlblRes.leftAnchor.constraint(equalTo: serverVerlbl.rightAnchor).isActive = true
//
        
        
        let baselbl2 =  UILabel()
        let clientVerlbl2 =  UILabel()
        let clientVerlblRes2 =  UILabel()
        
        baselbl2.textColor = .gray
        settingsView.addSubview(baselbl2)
        baselbl2.widthAnchor.constraint(equalTo: settingsView.widthAnchor, multiplier: 1).isActive = true
        baselbl2.translatesAutoresizingMaskIntoConstraints = false
        baselbl2.topAnchor.constraint(equalTo: baselbl1.bottomAnchor).isActive = true
        baselbl2.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        clientVerlbl2.text = "   Trim Version:  "
        clientVerlbl2.textAlignment = .left
        clientVerlbl2.font = UIFont.systemFont(ofSize: 12)
        clientVerlbl2.textColor = .gray
        baselbl2.addSubview(clientVerlbl2)
        clientVerlbl2.translatesAutoresizingMaskIntoConstraints = false
        clientVerlbl2.widthAnchor.constraint(equalTo: baselbl2.widthAnchor, multiplier: 1).isActive = true
        clientVerlbl2.topAnchor.constraint(equalTo: baselbl2.topAnchor).isActive = true
        clientVerlbl2.heightAnchor.constraint(equalToConstant: 25).isActive = true
        clientVerlbl2.leftAnchor.constraint(equalTo: baselbl2.leftAnchor)
        
        clientVerlblRes2.backgroundColor = .clear
        clientVerlblRes2.font = UIFont.systemFont(ofSize: 12)
        clientVerlblRes2.text =  GlobalArrays.requestConnectionModel.HPTRIMVer //"*********"
        baselbl2.addSubview(clientVerlblRes2)
        clientVerlblRes2.widthAnchor.constraint(equalTo: baselbl2.widthAnchor, multiplier: 1).isActive = true
        clientVerlblRes2.translatesAutoresizingMaskIntoConstraints = false
        clientVerlblRes2.topAnchor.constraint(equalTo: baselbl2.topAnchor).isActive = true
        clientVerlblRes2.heightAnchor.constraint(equalToConstant: 25).isActive = true
        baselbl2.addConstraintsWithFormat( "H:|-120-[v0]", views: clientVerlblRes2)

//        //Trim version and result
//        let trimVerlbl =  UILabel()
//        trimVerlbl.text = "TRIM Version: "  /// MAKE THIS CHANGE TO RM OR CM based on version
//        trimVerlbl.backgroundColor = .white
//        trimVerlbl.textAlignment = .left
//        trimVerlbl.font = UIFont.systemFont(ofSize: 12)
//        trimVerlbl.textColor = UIColor.rgb(91, green: 14, blue: 13)
//        trimVerlbl.sizeToFit()
//        settingsView.addSubview(trimVerlbl)
//        trimVerlbl.translatesAutoresizingMaskIntoConstraints = false
//        settingsView.addConstraintsWithFormat( "H:|-10-[v0]", views: trimVerlbl)
//        trimVerlbl.topAnchor.constraint(equalTo: baselbl1.bottomAnchor).isActive = true
//        
//        let trimVerlblRes =  UILabel()
//        trimVerlblRes.text = "*******"
//        trimVerlblRes.backgroundColor = .white
//        trimVerlblRes.textAlignment = .left
//        trimVerlblRes.font = UIFont.systemFont(ofSize: 12)
//        trimVerlblRes.textColor = UIColor.rgb(91, green: 14, blue: 13)
//        trimVerlblRes.sizeToFit()
//        settingsView.addSubview(trimVerlblRes)
//        trimVerlblRes.translatesAutoresizingMaskIntoConstraints = false
//        trimVerlblRes.topAnchor.constraint(equalTo: baselbl1.bottomAnchor).isActive = true
//        trimVerlblRes.leftAnchor.constraint(equalTo: trimVerlbl.rightAnchor).isActive = true
        
    }
    
   /*
    func setupCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        
        collectionView = UICollectionView(frame: settingsView.frame, collectionViewLayout: layout)
       // collectionView.register(DetailViewCell.self, forCellWithReuseIdentifier: "SettingsListCell")
        collectionView.backgroundColor = UIColor.rgb(215, green: 230, blue: 239) //UIColor.white
        //collectionView.delegate = self
       // collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsetsMake(3, 0, 0, 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(3, 0, 0, 0)
        
        settingsView.addSubview(collectionView)
       // settingsView.addConstraintsWithFormat( "H:|[v0]|", views: collectionView)
       // settingsView.addConstraintsWithFormat( "V:|-64-[v0(300)]|", views: collectionView)
        
    }
 */
    
    func showControllerForConnection(_ setting: Settings) {
       // let newViewController = ConnectionViewController()
    }
    
    func selectSettingsConfig(sender: UIButton)  {
        
        print("show settings config")
        if let window = UIApplication.shared.keyWindow {
            self.settingsView.frame = CGRect(x: -320, y: 0, width: 0, height: window.frame.height) //width: self.view.frame.width / 2
            self.blackView.backgroundColor = UIColor(white: 0, alpha: 0.0)
            self.blackView.alpha = 0
            //self.connectionLauncher.showSettingsUI()
            
//            for setConnection in settingsConnection {
//                setConnection.boolDefault = false
//                 PersistenceService.saveContext()
//            }
           

            let indexpath = NSIndexPath(row: sender.tag, section: 0) //NSIndexPath(index: sender.tag + 1)
            self.connectionLauncher.loadSettingsVariables(settingsConnection[indexpath.item] as SettingsConnection)
        }
        

    }
    
}

extension SettingsLauncher: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //Sets the size of the cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 320, height: 42) //(width: view.frame.width, height: 52)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      //  print("CoreData Collection Count  \(settingsConnection.count)")
        self.collectionView.collectionViewLayout.invalidateLayout()
        return settingsConnection.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SettingsListCell", for: indexPath) as! SettingsViewCell
        // cell.awakeFromNib()
        cell.configure(with: settingsConnection[indexPath.item])
        cell.backgroundColor = UIColor.rgb(215, green: 230, blue: 239)
        cell.cellEditConnImage.tag = indexPath.row
        cell.cellEditConnImage.addTarget(self, action: #selector(self.selectSettingsConfig(sender:)), for: .touchUpInside)
        cell.delegate = self
        
        return cell
    }
   
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellItem = settingsConnection[indexPath.item]
        //connectionLauncher.loadSettingsVariables(cellItem)
        
        CoreDataHelper.instance.getCoreDataSettings {
            (response) in
            for setConnection in response! {
                setConnection.boolDefault = false
                if cellItem == setConnection
                {
                    setConnection.boolDefault = true
                }
                print("setConnection=  \(setConnection.boolDefault)" )
                PersistenceService.saveContext()
            }
           // DispatchQueue.main.async(execute: self.collectionView.reloadData)
            collectionView.reloadData()
        }

//        let fetchRequest: NSFetchRequest<SettingsConnection> = SettingsConnection.fetchRequest()
//        do {
//            let settingsConnection = try PersistenceService.context.fetch(fetchRequest)
//            self.settingsConnection = settingsConnection
//            for setConnection in settingsConnection {
//                setConnection.boolDefault = false
//                if cellItem == setConnection
//                {
//                    setConnection.boolDefault = true
//                }
//                print("setConnection=  \(setConnection.boolDefault)" )
//                PersistenceService.saveContext()
//            }
//
//        }
//        catch {}

      //  fetchConnectionData()
        
       // DispatchQueue.main.async(execute: self.collectionView.reloadData)
        collectionView.reloadData()


    }
    
      

//    func fetchConnectionData() {
//        NetworkService.instance.httpRequests {
//            (response) in
//        }
//
//    }
    
    
  
    
      func yourFunc(sender : UIButton){
        print(sender.tag)
    }
}

//Cell clicked, do something
extension SettingsLauncher: SettingsListColectionViewCellDelegate {
    func changeColorOfButton(forCell: SettingsViewCell) {
        //forCell.button.backgroundColor = UIColor.blue
    }
}


