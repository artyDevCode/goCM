//
//  ConnectionLauncher.swift
//  goCM
//
//  Created by Arturo Plottier on 26/8/17.
//  Copyright © 2017 pac-apps. All rights reserved.
//

import UIKit

class ConnectionLauncher: NSObject {

    lazy var connectionMenuBar: ConnectionMenuBar = {
        let launcher = ConnectionMenuBar()
        launcher.connectionLauncher = self
        return launcher
    }()

//    let deleteServer :UIButton = {
//        let iv = UIButton()
//        iv.addTarget(self, action: #selector(deleteCurrServer), for: .touchUpInside)
//        iv.contentMode = .scaleAspectFit
//        iv.setTitle("Delete Server", for: .normal)
//        iv.backgroundColor = .clear
//        iv.tintColor = .red //UIColor.rgb(91, green: 14, blue: 13)
//        return iv
//    }()
    
    
    
    let connectionDetailLBL = UILabel()
    var connectionDetailTF = UITextField()
    let gatewayLBL = UILabel()
    let gatewayTF = UITextField()
    let httpsTF = UITextField()
    var httpsSwitch = UISwitch()
    let portTF = UITextField()
    let validateSSLTF = UITextField()
    let validateSSLSwich = UISwitch()
    let authenticationLBL = UILabel()
    let userNameTF = UITextField()
    let passwordTF = UITextField()
    let domainTF = UITextField()
    let basicAuthTF = UITextField()
    let basicAuthSwitch = UISwitch()
    let testConnectionBTN = UIButton()
    
    let timeoutsLBL = UILabel()
    let jsonTimeoutTF = UITextField()
    let fileTimeoutTF = UITextField()
    
    let resultsLBL = UILabel()
    let pageSizeTF = UITextField()
    let sortFieldTF = UITextField()
    let sortOrderTF = UITextField()
    
    let deleteServerBTN = UIButton()
    let borderColour = UIColor.rgb(215, green: 230, blue: 239)
    let connectionBtn = UIButton()

    let blackView = UIView()
    let connectionSView = UIScrollView() //UIView()
    let connectionView = UIView()
//    let connectionView: UIScrollView = {
//        let v = UIScrollView()
//        v.translatesAutoresizingMaskIntoConstraints = false
//        v.backgroundColor = .red
//        return v
//    }()
    
    let HTTPSlbla1 =  UIView()
    let HTTPSlbla2 =  UILabel()
    let HTTPSlbla3 =  UISwitch()
    let ValidateSSLlbla1 =  UIView()
    let ValidateSSLlbla2 =  UILabel()
    let ValidateSSLlbla3 =  UISwitch()
    let BasicAlbla1 =  UIView()
    let BasicAlbla2 =  UILabel()
    let BasicAlbla3 =  UISwitch()
    var settingsLauncher : SettingsLauncher?
    var homeLauncher : HomeLauncher?
    var settingsConnection: SettingsConnection?
    
    func showSettingsUI()  {
//        if let window = UIApplication.shared.keyWindow {
//            if (settingsConnection == nil) {
//                settingsConnection = SettingsConnection(context: PersistenceService.context)
//            }
//            self.blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
//            
//            self.blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismiss)))
//            self.blackView.frame = window.frame
//            window.addSubview(self.blackView)
//            
//            window.addSubview(self.connectionSView)
//            self.setupMenuBar()
//            self.connectionDetails()
//            self.gateway()
//            self.authentication()
//            self.testConnection()
//            self.timeouts()
//            self.results()
//            self.delButton()
//            self.blackView.alpha = 0
//            self.connectionSView.frame = CGRect(x: -320, y: 0, width: 0, height: window.frame.height) //width: self.view.frame.width / 2
//            
//            self.connectionSView.backgroundColor = .white
//            
//            
//            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear , animations: {
//                self.connectionSView.frame = CGRect(x: 0, y: 0, width: 320, height: 2000) //width: self.view.frame.width / 2
//                self.blackView.alpha = 1
//                self.clearFields()
//            }, completion: nil)
//            // self.showMessage(message: <#String#>)
//        }

        
        
        if let window = UIApplication.shared.keyWindow {
            if (settingsConnection == nil) {
                settingsConnection = SettingsConnection(context: PersistenceService.context)
            }
            self.blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            self.blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismiss)))
            self.blackView.frame = window.frame
            window.addSubview(self.blackView)
            
         
            connectionView.frame = CGRect(x: -320, y: 0, width: 320, height: window.frame.height)
            window.addSubview(self.connectionView)
//            window.addConstraintsWithFormat("H:|[v0(-320)]", views: connectionView)
//            window.addConstraintsWithFormat("V:|[v0]|", views: connectionView)
            connectionView.addSubview(connectionSView)
            connectionView.addConstraintsWithFormat("H:|[v0]|", views: connectionSView)
            connectionView.addConstraintsWithFormat("V:|-64-[v0]|", views: connectionSView)
            
          //  connectionSView.translatesAutoresizingMaskIntoConstraints = false
//
//            connectionSView.leftAnchor.constraint(equalTo: connectionView.leftAnchor).isActive = true
//            connectionSView.topAnchor.constraint(equalTo: connectionView.topAnchor).isActive = true
          //  connectionSView.widthAnchor.constraint(equalTo: connectionView.widthAnchor, multiplier: 1).isActive = true
          //  connectionSView.heightAnchor.constraint(equalToConstant: window.frame.height).isActive = true
//
            //connectionSView.frame = CGRect(x: -320, y: 64, width: 320, height: window.frame.height) //width: self.view.frame.width / 2
                       self.setupMenuBar()
           
            connectionSView.contentSize = CGSize(width: 320, height: 1000)
            connectionSView.isScrollEnabled = true
            self.connectionDetails()
            self.gateway()
            self.authentication()
            self.testConnection()
            self.timeouts()
            self.results()
            self.delButton()

           
            //connectionView.leftAnchor.constraint(equalTo: connectionSView.leftAnchor).isActive = true
           // connectionView.topAnchor.constraint(equalTo: connectionSView.topAnchor).isActive = true/            
           // connectionView.addConstraintsWithFormat("H:|[v0(320)]", views: connectionSView)
           // connectionView.addConstraintsWithFormat("V:|-64-[v0(300)]", views: connectionSView)
           // connectionView.contentSize = CGSize(width: 320, height: 2000)
            connectionSView.backgroundColor = .white
            connectionView.backgroundColor = .white

            
                       self.blackView.alpha = 0
           // self.connectionSView.frame = CGRect(x: -320, y: 0, width: 0, height: window.frame.height) //width: self.view.frame.width / 2
            
            
         
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear , animations: {
               // self.connectionSView.frame = CGRect(x: 0, y: 64, width: 320, height: window.frame.height)
                self.connectionView.frame = CGRect(x: 0, y: 0, width: 320, height: window.frame.height)
                self.blackView.alpha = 1
                self.clearFields()
            }, completion: nil)
           // self.showMessage(message: <#String#>)
        }
    }

    
    override init() {
        super.init()
        
    }

    func clearFields(){
        connectionMenuBar.updateConnectionBTN.isHidden = true
        connectionMenuBar.saveConnectionBTN.isHidden = false
        connectionMenuBar.updateConnectionBTN.alpha = 0
        connectionMenuBar.saveConnectionBTN.alpha = 1
        connectionDetailTF.text = ""
        gatewayTF.text = ""
        httpsSwitch.setOn(false, animated: false)
        portTF.text = "80"
        validateSSLSwich.setOn(false, animated: false)
        userNameTF.text = ""
        passwordTF.text = ""
        domainTF.text = ""
        basicAuthSwitch.setOn(false, animated: false)
        jsonTimeoutTF.text = "30"
        fileTimeoutTF.text = "60"
        pageSizeTF.text = "50"
        sortFieldTF.text = "Title"
        sortOrderTF.text = "Ascending"
    }

    
    func deleteCurrServer() {
      //  let settingsConnection = SettingsConnection(context: PersistenceService.context)
        PersistenceService.context.delete(settingsConnection!)
        PersistenceService.saveContext()
        handleDismiss()
    }

    func loadSettingsVariables(_ settingsConn: SettingsConnection){
        settingsConnection = settingsConn
         self.showSettingsUI()
        connectionMenuBar.updateConnectionBTN.isHidden = false
        connectionMenuBar.saveConnectionBTN.isHidden = true
        connectionMenuBar.updateConnectionBTN.alpha = 1
        connectionMenuBar.saveConnectionBTN.alpha = 0
         connectionDetailTF.text = settingsConn.textConnection
         gatewayTF.text = settingsConn.textGateway
         httpsSwitch.setOn(settingsConn.boolHTTPS, animated: false)
         portTF.text = settingsConn.textPort
         validateSSLSwich.setOn(settingsConn.boolValidateSSL, animated: false)
         userNameTF.text = settingsConn.textUserName
         passwordTF.text = settingsConn.textPassword
         domainTF.text = settingsConn.textDomain
         basicAuthSwitch.setOn(settingsConn.boolBasicAuth, animated: false)
         jsonTimeoutTF.text = settingsConn.textJSONTimeout
         fileTimeoutTF.text = settingsConn.textFileTimeout
         pageSizeTF.text = settingsConn.textPageSize
         sortFieldTF.text = settingsConn.textSortField
         sortOrderTF.text = settingsConn.textSortOrder
         print(settingsConn.boolDefault)
       
    }
    
    
    
    
    func saveConnectionSettings() {
        addUpdateConnectionSettings()
        handleDismiss()
    }

    func copyUItoSettingsConnection() {

        settingsConnection?.boolDefault = true
        settingsConnection?.textConnection = connectionDetailTF.text
        settingsConnection?.textDomain = domainTF.text
        settingsConnection?.textFileTimeout = fileTimeoutTF.text
        settingsConnection?.textGateway = gatewayTF.text
        settingsConnection?.textJSONTimeout = jsonTimeoutTF.text
        settingsConnection?.textPageSize = pageSizeTF.text
        settingsConnection?.textPassword = passwordTF.text
        settingsConnection?.textPort = portTF.text
        settingsConnection?.textSortField = sortFieldTF.text
        settingsConnection?.textSortOrder = sortOrderTF.text
        settingsConnection?.textUserName = userNameTF.text
        settingsConnection?.boolBasicAuth = basicAuthSwitch.isOn
        settingsConnection?.boolHTTPS = httpsSwitch.isOn
        settingsConnection?.boolValidateSSL = validateSSLSwich.isOn

    }
    
    func addUpdateConnectionSettings() {
        CoreDataHelper.instance.getCoreDataSettings {
            (response) in
            for setConnection in response! {
                setConnection.boolDefault = false
                print("setConnection=  \(setConnection.boolDefault)" )
                PersistenceService.saveContext()
            }
            self.copyUItoSettingsConnection()
            PersistenceService.saveContext()
            self.handleDismiss()

        }

    }
    

    func handleDismiss() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear , animations: {
            if let window = UIApplication.shared.keyWindow {
                self.connectionSView.frame = CGRect(x: -320, y: 0, width: 0, height: window.frame.height) //width: self.view.frame.width / 2
                self.blackView.backgroundColor = UIColor(white: 0, alpha: 0.0)
                self.blackView.alpha = 0
            }
        }) { (completed: Bool) in
            self.settingsLauncher?.showSettingsUI()
        }
    }

    func testConnectionSettings(){
        connectionSView.endEditing(true)
      //  settingsConnection = SettingsConnection(context: PersistenceService.context)
        copyUItoSettingsConnection()
        NetworkService.instance.httpRequestConnection(settingsConnection: settingsConnection!, httpAdditionalString: "&a=sp") {
            (response) in
            print("response - \(response)")
           // if (response == "401") {
           // }
            DisplayMessage.instance.showMessage(message: "Successfully Connected to the Server", color: .blue)
            // self.handleDismiss()
        }

    }
    
    

    
    fileprivate func setupMenuBar() {
        connectionView.addSubview(connectionMenuBar)
        connectionView.addConstraintsWithFormat("H:|[v0]|", views: connectionMenuBar)
        connectionView.addConstraintsWithFormat("V:|[v0(64)]", views: connectionMenuBar)
//        self.connectionMenuBar.translatesAutoresizingMaskIntoConstraints = false
//        self.connectionMenuBar.topAnchor.constraint(equalTo: connectionSView.topAnchor).isActive = true
//        self.connectionMenuBar.widthAnchor.constraint(equalTo: self.connectionSView.widthAnchor, multiplier: 1).isActive = true
//        self.connectionMenuBar.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
    }
    
    fileprivate func insertLabelInTextField(labelTXT: String) -> UILabel{
        let textLBL = UILabel()
        textLBL.frame = CGRect(x: 0, y: 0, width: 100, height: 42)
        textLBL.text = labelTXT
        textLBL.font = UIFont.systemFont(ofSize: 12)
        textLBL.backgroundColor = .clear
        textLBL.textAlignment = .right
        textLBL.numberOfLines = 0
        textLBL.lineBreakMode = NSLineBreakMode.byWordWrapping
        textLBL.textColor = .gray // UIColor.rgb(230, green: 230, blue: 230)
        return textLBL
    }
    
    
    fileprivate func connectionDetails() {
        
        connectionDetailLBL.backgroundColor = .white
        connectionDetailLBL.text = "   Connection Details"
        connectionDetailLBL.numberOfLines = 1
        connectionDetailLBL.textColor = UIColor.rgb(91, green: 14, blue: 13)
        connectionDetailLBL.textAlignment = .left
        connectionSView.addSubview(connectionDetailLBL)
        connectionDetailLBL.translatesAutoresizingMaskIntoConstraints = false
       // connectionSView.addConstraintsWithFormat( "V:|-64-[v0(42)]", views: connectionDetailLBL)
        connectionDetailLBL.topAnchor.constraint(equalTo: connectionSView.topAnchor).isActive = true
        connectionSView.widthAnchor.constraint(equalTo: connectionDetailLBL.widthAnchor, multiplier: 1).isActive = true
        connectionDetailLBL.heightAnchor.constraint(equalToConstant: 42).isActive = true
       
        
        let lbl = insertLabelInTextField(labelTXT: "Name: ")
        connectionDetailTF.leftView?.contentMode = .right
        connectionDetailTF.leftViewMode = UITextFieldViewMode.always
        connectionDetailTF.leftView = lbl
        connectionDetailTF.keyboardType = .default
        connectionDetailTF.borderStyle = .roundedRect
        connectionDetailTF.autocorrectionType = UITextAutocorrectionType.no
        connectionDetailTF.layer.borderWidth = 1.0
        connectionDetailTF.layer.borderColor = borderColour.cgColor
        connectionSView.addSubview(connectionDetailTF)
        connectionDetailTF.translatesAutoresizingMaskIntoConstraints = false
        connectionSView.leftAnchor.constraint(equalTo: connectionDetailTF.leftAnchor).isActive = true
        connectionDetailTF.topAnchor.constraint(equalTo: connectionDetailLBL.bottomAnchor).isActive = true
        connectionSView.widthAnchor.constraint(equalTo: connectionDetailTF.widthAnchor, multiplier: 1).isActive = true
        connectionDetailTF.heightAnchor.constraint(equalToConstant: 42).isActive = true
     }
    
    fileprivate func gateway() {
        gatewayLBL.backgroundColor = .white
        gatewayLBL.text = "   Gateway"
        gatewayLBL.textColor = UIColor.rgb(91, green: 14, blue: 13)
        gatewayLBL.textAlignment = .left
        connectionSView.addSubview(gatewayLBL)
        gatewayLBL.translatesAutoresizingMaskIntoConstraints = false
      //  connectionSView.addConstraintsWithFormat( "H:|[v0]|", views: gatewayLBL)
        gatewayLBL.topAnchor.constraint(equalTo: connectionDetailTF.bottomAnchor).isActive = true
        gatewayLBL.widthAnchor.constraint(equalTo: connectionSView.widthAnchor, multiplier: 1).isActive = true
        gatewayLBL.heightAnchor.constraint(equalToConstant: 42).isActive = true

        let lbl1 = insertLabelInTextField(labelTXT: "Gateway: ")
        gatewayTF.leftViewMode = UITextFieldViewMode.always
        gatewayTF.leftView = lbl1
        gatewayTF.keyboardType = .default
        gatewayTF.borderStyle = .roundedRect
        gatewayTF.layer.borderWidth = 1.0
        gatewayTF.layer.borderColor = borderColour.cgColor
        gatewayTF.backgroundColor = .white
        gatewayTF.layer.borderWidth = 1.0
        connectionSView.addSubview(gatewayTF)
        gatewayTF.translatesAutoresizingMaskIntoConstraints = false
        gatewayTF.leftAnchor.constraint(equalTo: connectionSView.leftAnchor).isActive = true
        gatewayTF.topAnchor.constraint(equalTo: gatewayLBL.bottomAnchor).isActive = true
        gatewayTF.widthAnchor.constraint(equalTo: connectionSView.widthAnchor, multiplier: 1).isActive = true
        gatewayTF.heightAnchor.constraint(equalToConstant: 42).isActive = true

        
        //USE THIS SETTING FOR SWITCH
//        HTTPSlbla2.text = "HTTPS?:"
//        HTTPSlbla2.textAlignment = .right
//        HTTPSlbla2.font = UIFont.systemFont(ofSize: 12)
//        HTTPSlbla2.textColor = .gray
//        connectionSView.addSubview(HTTPSlbla2)
//        HTTPSlbla2.widthAnchor.constraint(equalToConstant: 320).isActive = true
//        connectionSView.leftAnchor.constraint(equalTo: HTTPSlbla3.leftAnchor).isActive = true
//        HTTPSlbla2.topAnchor.constraint(equalTo: gatewayTF.bottomAnchor).isActive = true
//        HTTPSlbla2.heightAnchor.constraint(equalToConstant: 42).isActive = true
//
//       // gatewayTF.addConstraintsWithFormat("V:|[v0(42)]", views: HTTPSlbla2)
//        
//        HTTPSlbla3.backgroundColor = .white
//        HTTPSlbla3.isEnabled = true
//        HTTPSlbla3.alpha = 1
//        connectionSView.addSubview(HTTPSlbla3)
//        HTTPSlbla3.widthAnchor.constraint(equalToConstant: 320).isActive = true
//                connectionSView.leftAnchor.constraint(equalTo: HTTPSlbla3.rightAnchor).isActive = true
//                HTTPSlbla3.topAnchor.constraint(equalTo: gatewayTF.bottomAnchor).isActive = true
//                HTTPSlbla3.heightAnchor.constraint(equalToConstant: 42).isActive = true
//
     //   connectionSView.addConstraintsWithFormat( "H:|[v0(100)]-20-[v1]", views: HTTPSlbla2, HTTPSlbla3)
      //  gatewayTF.addConstraintsWithFormat("V:|[v0(42)]", views: HTTPSlbla3)

       ////// HTTPSlbla1.textColor = .gray
//        connectionSView.addSubview(HTTPSlbla1)
//        HTTPSlbla1.translatesAutoresizingMaskIntoConstraints = false
//        HTTPSlbla1.widthAnchor.constraint(equalToConstant: 320).isActive = true
//        connectionSView.leftAnchor.constraint(equalTo: HTTPSlbla1.leftAnchor).isActive = true
//        HTTPSlbla1.topAnchor.constraint(equalTo: gatewayTF.bottomAnchor).isActive = true
//        HTTPSlbla1.heightAnchor.constraint(equalToConstant: 42).isActive = true
//
//        HTTPSlbla2.text = "HTTPS?:"
//        HTTPSlbla2.textAlignment = .right
//        HTTPSlbla2.font = UIFont.systemFont(ofSize: 12)
//        HTTPSlbla2.textColor = .gray
//        HTTPSlbla2.backgroundColor = .white
//        HTTPSlbla1.addSubview(HTTPSlbla2)
//        HTTPSlbla1.addConstraintsWithFormat("V:|[v0]|", views: HTTPSlbla2)
//
//        HTTPSlbla3.backgroundColor = .white
//        HTTPSlbla3.isEnabled = true
//        HTTPSlbla1.addSubview(HTTPSlbla3)
//        HTTPSlbla1.addConstraintsWithFormat( "H:|[v0(100)]-20-[v1]", views: HTTPSlbla2, HTTPSlbla3)
//        HTTPSlbla1.addConstraintsWithFormat("V:|-6-[v0]|", views: HTTPSlbla3)
        /////
        
        
        HTTPSlbla1.backgroundColor = .white
        connectionSView.addSubview(HTTPSlbla1)
        HTTPSlbla1.translatesAutoresizingMaskIntoConstraints = false
        HTTPSlbla1.leftAnchor.constraint(equalTo: connectionSView.leftAnchor).isActive = true
        HTTPSlbla1.widthAnchor.constraint(equalToConstant: 320).isActive = true
        HTTPSlbla1.topAnchor.constraint(equalTo: gatewayTF.bottomAnchor).isActive = true
        HTTPSlbla1.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        HTTPSlbla2.text = "HTTPS?:"
        HTTPSlbla2.textAlignment = .right
        HTTPSlbla2.font = UIFont.systemFont(ofSize: 12)
        HTTPSlbla2.textColor = .gray
        HTTPSlbla2.numberOfLines = 0
        HTTPSlbla2.lineBreakMode = NSLineBreakMode.byWordWrapping
        HTTPSlbla1.addSubview(HTTPSlbla2)
        HTTPSlbla1.addConstraintsWithFormat("V:|[v0]|", views: HTTPSlbla2)
        HTTPSlbla3.backgroundColor = .white
        HTTPSlbla1.addSubview(HTTPSlbla3)
        HTTPSlbla1.addConstraintsWithFormat( "H:|[v0(100)]-20-[v1]", views: HTTPSlbla2, HTTPSlbla3)
        HTTPSlbla1.addConstraintsWithFormat("V:|-6-[v0]|", views: HTTPSlbla3)

        
        
        
        let lbl3 = insertLabelInTextField(labelTXT: "Port: ")
        portTF.leftViewMode = UITextFieldViewMode.always
        portTF.leftView = lbl3
        portTF.keyboardType = .default
        portTF.borderStyle = .roundedRect
        portTF.layer.borderWidth = 1.0
        portTF.layer.borderColor = borderColour.cgColor
        connectionSView.addSubview(portTF)
        portTF.translatesAutoresizingMaskIntoConstraints = false
        portTF.leftAnchor.constraint(equalTo: connectionSView.leftAnchor).isActive = true
        portTF.topAnchor.constraint(equalTo: HTTPSlbla2.bottomAnchor).isActive = true
        portTF.widthAnchor.constraint(equalTo: connectionSView.widthAnchor, multiplier: 1).isActive = true
        portTF.heightAnchor.constraint(equalToConstant: 42).isActive = true

        ValidateSSLlbla1.backgroundColor = .white
        connectionSView.addSubview(ValidateSSLlbla1)
        ValidateSSLlbla1.translatesAutoresizingMaskIntoConstraints = false
        ValidateSSLlbla1.leftAnchor.constraint(equalTo: connectionSView.leftAnchor).isActive = true
        ValidateSSLlbla1.widthAnchor.constraint(equalToConstant: 320).isActive = true
        ValidateSSLlbla1.topAnchor.constraint(equalTo: portTF.bottomAnchor).isActive = true
        ValidateSSLlbla1.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        ValidateSSLlbla2.text = "Validate SSL:"
        ValidateSSLlbla2.textAlignment = .right
        ValidateSSLlbla2.font = UIFont.systemFont(ofSize: 12)
        ValidateSSLlbla2.textColor = .gray
        ValidateSSLlbla1.addSubview(ValidateSSLlbla2)
        ValidateSSLlbla1.addConstraintsWithFormat("V:|[v0]|", views: ValidateSSLlbla2)
        ValidateSSLlbla3.backgroundColor = .white
        ValidateSSLlbla1.addSubview(ValidateSSLlbla3)
        ValidateSSLlbla1.addConstraintsWithFormat( "H:|[v0(100)]-20-[v1]", views: ValidateSSLlbla2, ValidateSSLlbla3)
        ValidateSSLlbla1.addConstraintsWithFormat("V:|-6-[v0]|", views: ValidateSSLlbla3)

        
        
    }
    
    fileprivate func authentication() {
        authenticationLBL.backgroundColor = .white
        authenticationLBL.text = "   Authentication"
        authenticationLBL.textColor = UIColor.rgb(91, green: 14, blue: 13)
        authenticationLBL.textAlignment = .left
        connectionSView.addSubview(authenticationLBL)
        authenticationLBL.translatesAutoresizingMaskIntoConstraints = false
        //connectionSView.addConstraintsWithFormat( "H:|-10-[v0]", views: authenticationLBL)
        authenticationLBL.topAnchor.constraint(equalTo: ValidateSSLlbla1.bottomAnchor).isActive = true
        authenticationLBL.widthAnchor.constraint(equalTo: connectionSView.widthAnchor, multiplier: 1).isActive = true
        authenticationLBL.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        let lbl5 = insertLabelInTextField(labelTXT: "Username: ")
        userNameTF.leftViewMode = UITextFieldViewMode.always
        userNameTF.leftView = lbl5
        userNameTF.keyboardType = .default
        userNameTF.borderStyle = .roundedRect
        userNameTF.layer.borderWidth = 1.0
        userNameTF.layer.borderColor = borderColour.cgColor
        connectionSView.addSubview(userNameTF)
        userNameTF.translatesAutoresizingMaskIntoConstraints = false
        userNameTF.leftAnchor.constraint(equalTo: connectionSView.leftAnchor).isActive = true
        userNameTF.topAnchor.constraint(equalTo: authenticationLBL.bottomAnchor).isActive = true
        userNameTF.widthAnchor.constraint(equalTo: connectionSView.widthAnchor, multiplier: 1).isActive = true
        userNameTF.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        let lbl6 = insertLabelInTextField(labelTXT: "Password: ")
        passwordTF.leftViewMode = UITextFieldViewMode.always
        passwordTF.leftView = lbl6
        passwordTF.isSecureTextEntry = true
        passwordTF.keyboardType = .default
        passwordTF.borderStyle = .roundedRect
        passwordTF.layer.borderWidth = 0.5
        passwordTF.layer.borderColor = borderColour.cgColor
        connectionSView.addSubview(passwordTF)
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.leftAnchor.constraint(equalTo: connectionSView.leftAnchor).isActive = true
        passwordTF.topAnchor.constraint(equalTo: userNameTF.bottomAnchor).isActive = true
        passwordTF.widthAnchor.constraint(equalTo: connectionSView.widthAnchor, multiplier: 1).isActive = true
        passwordTF.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        let lbl7 = insertLabelInTextField(labelTXT: "Domain: ")
        domainTF.leftViewMode = UITextFieldViewMode.always
        domainTF.leftView = lbl7
        domainTF.keyboardType = .default
        domainTF.borderStyle = .roundedRect
        domainTF.layer.borderWidth = 1.0
        domainTF.layer.borderColor = borderColour.cgColor
        domainTF.autocapitalizationType = UITextAutocapitalizationType.allCharacters
        connectionSView.addSubview(domainTF)
        domainTF.translatesAutoresizingMaskIntoConstraints = false
        domainTF.leftAnchor.constraint(equalTo: connectionSView.leftAnchor).isActive = true
        domainTF.topAnchor.constraint(equalTo: passwordTF.bottomAnchor).isActive = true
        domainTF.widthAnchor.constraint(equalTo: connectionSView.widthAnchor, multiplier: 1).isActive = true
        domainTF.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
//        let lbl8 = insertLabelInTextField(labelTXT: "Basic Authentication: ")
//        basicAuthTF.leftViewMode = UITextFieldViewMode.always
//        basicAuthTF.rightViewMode = UITextFieldViewMode.always
//        basicAuthTF.leftView = lbl8
//        basicAuthTF.rightView = basicAuthSwitch
//        connectionSView.addSubview(basicAuthTF)
//        basicAuthTF.translatesAutoresizingMaskIntoConstraints = false
//        basicAuthTF.topAnchor.constraint(equalTo: domainTF.bottomAnchor).isActive = true
//        basicAuthTF.widthAnchor.constraint(equalTo: connectionSView.widthAnchor, multiplier: 1).isActive = true
//        basicAuthTF.heightAnchor.constraint(equalToConstant: 42).isActive = true

        
//////
//        BasicAlbla1.widthAnchor.constraint(equalToConstant: 320).isActive = true
//        BasicAlbla1.backgroundColor = .white
//        connectionSView.addSubview(BasicAlbla1)
//        BasicAlbla1.translatesAutoresizingMaskIntoConstraints = false
//        BasicAlbla1.leftAnchor.constraint(equalTo: connectionSView.leftAnchor).isActive = true
//        BasicAlbla1.topAnchor.constraint(equalTo: domainTF.bottomAnchor).isActive = true
//        BasicAlbla1.heightAnchor.constraint(equalToConstant: 42).isActive = true
//        
//        BasicAlbla2.text = "Basic Authentication:"
//        BasicAlbla2.textAlignment = .right
//        BasicAlbla2.font = UIFont.systemFont(ofSize: 12)
//        BasicAlbla2.textColor = .gray
//        BasicAlbla2.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        BasicAlbla2.numberOfLines = 0
//        BasicAlbla2.lineBreakMode = NSLineBreakMode.byWordWrapping
//        BasicAlbla1.addSubview(BasicAlbla2)
//        BasicAlbla1.addConstraintsWithFormat("V:|[v0]|", views: BasicAlbla2)
//        
//        BasicAlbla3.backgroundColor = .white
//        BasicAlbla1.addSubview(BasicAlbla3)
//        BasicAlbla3.translatesAutoresizingMaskIntoConstraints = false
//        BasicAlbla1.addConstraintsWithFormat( "H:|[v0(100)]-20-[v1]", views: BasicAlbla2, BasicAlbla3)
//        BasicAlbla1.addConstraintsWithFormat("V:|-6-[v0]|", views: BasicAlbla3)
//////
        
        BasicAlbla1.backgroundColor = .white
        connectionSView.addSubview(BasicAlbla1)
        BasicAlbla1.translatesAutoresizingMaskIntoConstraints = false
        BasicAlbla1.leftAnchor.constraint(equalTo: connectionSView.leftAnchor).isActive = true
        BasicAlbla1.widthAnchor.constraint(equalToConstant: 320).isActive = true
        BasicAlbla1.topAnchor.constraint(equalTo: domainTF.bottomAnchor).isActive = true
        BasicAlbla1.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        BasicAlbla2.text = "Basic Authentication:"
        BasicAlbla2.textAlignment = .right
        BasicAlbla2.font = UIFont.systemFont(ofSize: 12)
        BasicAlbla2.textColor = .gray
        BasicAlbla2.numberOfLines = 0
        BasicAlbla2.lineBreakMode = NSLineBreakMode.byWordWrapping
        BasicAlbla1.addSubview(BasicAlbla2)
        BasicAlbla1.addConstraintsWithFormat("V:|[v0]|", views: BasicAlbla2)
        BasicAlbla3.backgroundColor = .white
        BasicAlbla1.addSubview(BasicAlbla3)
        BasicAlbla1.addConstraintsWithFormat( "H:|[v0(100)]-20-[v1]", views: BasicAlbla2, BasicAlbla3)
        BasicAlbla1.addConstraintsWithFormat("V:|-6-[v0]|", views: BasicAlbla3)

        
        
    }
    
    func testConnection(){
        connectionBtn.addTarget(self, action: #selector(testConnectionSettings), for: .touchUpInside)
        connectionBtn.contentMode = .scaleAspectFit
        connectionBtn.setTitle("Test Connection", for: .normal)
        connectionBtn.backgroundColor = .white
        connectionBtn.setTitleColor(UIColor.rgb(91, green: 14, blue: 93), for: .normal)
        connectionSView.addSubview(connectionBtn)
        connectionBtn.translatesAutoresizingMaskIntoConstraints = false
        connectionBtn.leftAnchor.constraint(equalTo: connectionSView.leftAnchor).isActive = true
        connectionBtn.topAnchor.constraint(equalTo: BasicAlbla1.bottomAnchor).isActive = true
        connectionBtn.widthAnchor.constraint(equalTo: connectionSView.widthAnchor, multiplier: 1).isActive = true
        connectionBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true

    }
    
    
    
    
    
    fileprivate func timeouts() {
        timeoutsLBL.backgroundColor = .white
        timeoutsLBL.text = "   Timeouts"
        timeoutsLBL.textColor = UIColor.rgb(91, green: 14, blue: 13)
        timeoutsLBL.textAlignment = .left
        connectionSView.addSubview(timeoutsLBL)
        timeoutsLBL.translatesAutoresizingMaskIntoConstraints = false
      //  connectionSView.addConstraintsWithFormat( "H:|-10-[v0]", views: timeoutsLBL)
        timeoutsLBL.topAnchor.constraint(equalTo: connectionBtn.bottomAnchor).isActive = true
        timeoutsLBL.widthAnchor.constraint(equalTo: connectionSView.widthAnchor, multiplier: 1).isActive = true
        timeoutsLBL.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        let lbl9 = insertLabelInTextField(labelTXT: "JSON Timeout: ")
        jsonTimeoutTF.leftViewMode = UITextFieldViewMode.always
        jsonTimeoutTF.leftView = lbl9
        jsonTimeoutTF.keyboardType = .default
        jsonTimeoutTF.borderStyle = .roundedRect
        jsonTimeoutTF.layer.borderWidth = 1.0
        jsonTimeoutTF.layer.borderColor = borderColour.cgColor
        connectionSView.addSubview(jsonTimeoutTF)
        jsonTimeoutTF.translatesAutoresizingMaskIntoConstraints = false
        jsonTimeoutTF.leftAnchor.constraint(equalTo: connectionSView.leftAnchor).isActive = true
        jsonTimeoutTF.topAnchor.constraint(equalTo: timeoutsLBL.bottomAnchor).isActive = true
        jsonTimeoutTF.widthAnchor.constraint(equalTo: connectionSView.widthAnchor, multiplier: 1).isActive = true
        jsonTimeoutTF.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        let lbl10 = insertLabelInTextField(labelTXT: "File Timeout: ")
        fileTimeoutTF.leftViewMode = UITextFieldViewMode.always
        fileTimeoutTF.leftView = lbl10
        fileTimeoutTF.keyboardType = .default
        fileTimeoutTF.borderStyle = .roundedRect
        fileTimeoutTF.layer.borderWidth = 1.0
        fileTimeoutTF.layer.borderColor = borderColour.cgColor
        connectionSView.addSubview(fileTimeoutTF)
        fileTimeoutTF.translatesAutoresizingMaskIntoConstraints = false
        fileTimeoutTF.leftAnchor.constraint(equalTo: connectionSView.leftAnchor).isActive = true
        fileTimeoutTF.topAnchor.constraint(equalTo: jsonTimeoutTF.bottomAnchor).isActive = true
        fileTimeoutTF.widthAnchor.constraint(equalTo: connectionSView.widthAnchor, multiplier: 1).isActive = true
        fileTimeoutTF.heightAnchor.constraint(equalToConstant: 42).isActive = true
        

        
    }
    
    fileprivate func results() {
        
        resultsLBL.text = "   Results"
        resultsLBL.backgroundColor = .white
        resultsLBL.textColor = UIColor.rgb(91, green: 14, blue: 13)
        resultsLBL.textAlignment = .left
        connectionSView.addSubview(resultsLBL)
        resultsLBL.translatesAutoresizingMaskIntoConstraints = false
       // connectionSView.addConstraintsWithFormat( "H:|-10-[v0]", views: resultsLBL)
        resultsLBL.topAnchor.constraint(equalTo: fileTimeoutTF.bottomAnchor).isActive = true
        resultsLBL.widthAnchor.constraint(equalTo: connectionSView.widthAnchor, multiplier: 1).isActive = true
        resultsLBL.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        let lbl11 = insertLabelInTextField(labelTXT: "Page Size: ")
        pageSizeTF.leftViewMode = UITextFieldViewMode.always
        pageSizeTF.leftView = lbl11
        pageSizeTF.keyboardType = .default
        pageSizeTF.borderStyle = .roundedRect
        pageSizeTF.layer.borderWidth = 1.0
        pageSizeTF.layer.borderColor = borderColour.cgColor
        connectionSView.addSubview(pageSizeTF)
        pageSizeTF.translatesAutoresizingMaskIntoConstraints = false
        pageSizeTF.leftAnchor.constraint(equalTo: connectionSView.leftAnchor).isActive = true
        pageSizeTF.topAnchor.constraint(equalTo: resultsLBL.bottomAnchor).isActive = true
        pageSizeTF.widthAnchor.constraint(equalTo: connectionSView.widthAnchor, multiplier: 1).isActive = true
        pageSizeTF.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        let lbl12 = insertLabelInTextField(labelTXT: "Sort Field: ")
        sortFieldTF.leftViewMode = UITextFieldViewMode.always
        sortFieldTF.leftView = lbl12
        sortFieldTF.keyboardType = .default
        sortFieldTF.borderStyle = .roundedRect
        sortFieldTF.layer.borderWidth = 1.0
        sortFieldTF.layer.borderColor = borderColour.cgColor
        connectionSView.addSubview(sortFieldTF)
        sortFieldTF.translatesAutoresizingMaskIntoConstraints = false
        sortFieldTF.leftAnchor.constraint(equalTo: connectionSView.leftAnchor).isActive = true
        sortFieldTF.topAnchor.constraint(equalTo: pageSizeTF.bottomAnchor).isActive = true
        sortFieldTF.widthAnchor.constraint(equalTo: connectionSView.widthAnchor, multiplier: 1).isActive = true
        sortFieldTF.heightAnchor.constraint(equalToConstant: 42).isActive = true

        let lbl13 = insertLabelInTextField(labelTXT: "Sort Order: ")
        sortOrderTF.leftViewMode = UITextFieldViewMode.always
        sortOrderTF.leftView = lbl13
        sortOrderTF.keyboardType = .default
        sortOrderTF.borderStyle = .roundedRect
        connectionSView.addSubview(sortOrderTF)
        sortOrderTF.translatesAutoresizingMaskIntoConstraints = false
        sortOrderTF.leftAnchor.constraint(equalTo: connectionSView.leftAnchor).isActive = true
        sortOrderTF.topAnchor.constraint(equalTo: sortFieldTF.bottomAnchor).isActive = true
        sortOrderTF.widthAnchor.constraint(equalTo: connectionSView.widthAnchor, multiplier: 1).isActive = true
        sortOrderTF.heightAnchor.constraint(equalToConstant: 42).isActive = true

    }
    func delButton(){
        let deleteServer = UIButton()
        deleteServer.addTarget(self, action: #selector(deleteCurrServer), for: .touchUpInside)
        deleteServer.contentMode = .scaleAspectFit
        deleteServer.setTitle("Delete Server", for: .normal)
        deleteServer.backgroundColor = .white
        deleteServer.setTitleColor(.red, for: .normal)
        connectionSView.addSubview(deleteServer)
        deleteServer.translatesAutoresizingMaskIntoConstraints = false
        deleteServer.leftAnchor.constraint(equalTo: connectionSView.leftAnchor).isActive = true
        deleteServer.topAnchor.constraint(equalTo: sortOrderTF.bottomAnchor).isActive = true
        deleteServer.widthAnchor.constraint(equalTo: connectionSView.widthAnchor, multiplier: 1).isActive = true
        deleteServer.heightAnchor.constraint(equalToConstant: 40).isActive = true

        
    }

 }
