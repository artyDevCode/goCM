//
//  ConnectionMenuBar.swift
//  goCM
//
//  Created by Arturo Plottier on 26/8/17.
//  Copyright © 2017 pac-apps. All rights reserved.
//

import UIKit

class Connection: NSObject {
    let imageName: String
    let connectionName: String
    let connectionBTN: String
    
    init( imageName: String, connectionName: String, connectionBTN: String) {
        self.imageName = imageName
        self.connectionName = connectionName
        self.connectionBTN = connectionBTN
    }
    
}


class ConnectionMenuBar: UIView {
    var connectionLauncher: ConnectionLauncher?
    let imageView :UIButton = {
        let iv = UIButton() // UIButton(image: UIImage(named: "gotrim")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMore))
        iv.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        iv.setImage(UIImage(named: "leftarrow"), for: .normal)
        iv.contentMode = .scaleAspectFit
        iv.tintColor = UIColor.rgb(91, green: 14, blue: 13)
        iv.backgroundColor = .clear
        return iv
    }()
    
    let connectionlbl: UILabel = {
        let lbl =  UILabel()//(frame: CGRect(x: 0, y: 0, width: 100 , height: frame.height))
        lbl.text = "Add Connection"
        lbl.textAlignment = .center
        lbl.contentMode = .scaleAspectFit
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textColor = UIColor.rgb(91, green: 14, blue: 13)
        return lbl
    }()
    
    
    let updateConnectionBTN: UIButton = {
        let btn =  UIButton()//(frame: CGRect(x: 0, y: 0, width: 100 , height: frame.height))
        btn.addTarget(self, action: #selector(AddUpdateConnections), for: .touchUpInside)
        btn.setTitle("Update", for: .normal)
        btn.contentMode = .scaleAspectFit
        btn.isUserInteractionEnabled = true
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.setTitleColor(UIColor.rgb(91, green: 14, blue: 13), for: .normal)
        return btn
    }()
    
    let saveConnectionBTN: UIButton = {
        let btn =  UIButton()//(frame: CGRect(x: 0, y: 0, width: 100 , height: frame.height))
        btn.addTarget(self, action: #selector(SaveConnections), for: .touchUpInside)
        btn.setTitle("Save", for: .normal)
        btn.contentMode = .scaleAspectFit
        btn.isUserInteractionEnabled = true
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.setTitleColor(UIColor.rgb(91, green: 14, blue: 13), for: .normal)
        return btn
    }()

   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // setupHorizontalBar()
//        let horizontalBarView = UIView()
//        horizontalBarView.backgroundColor = GlobalVars.instance.GlobalBackgroundColor() //UIColor.rgb(215, green: 230, blue: 239)
//        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
//        addSubview(horizontalBarView)
//        addConstraintsWithFormat( "H:|[v0]|", views: horizontalBarView)
//        addConstraintsWithFormat( "V:|[v0(64)]", views: horizontalBarView)

        self.backgroundColor = GlobalVars.instance.GlobalBackgroundColor()
      
       
        addSubview(imageView)
        addConstraintsWithFormat( "H:|-10-[v0(22)]", views: imageView)
        addConstraintsWithFormat( "V:[v0(22)]-8-|", views: imageView)
        
        addSubview(connectionlbl)
        addConstraintsWithFormat( "H:|-65-[v0(150)]", views: connectionlbl)
        addConstraintsWithFormat( "V:[v0(22)]-8-|", views: connectionlbl)
        
        addSubview(updateConnectionBTN)
        addConstraintsWithFormat( "H:[v0(50)]-10-|", views: updateConnectionBTN)
        addConstraintsWithFormat( "V:[v0(22)]-8-|", views: updateConnectionBTN)

        addSubview(saveConnectionBTN)
        addConstraintsWithFormat( "H:[v0(50)]-10-|", views: saveConnectionBTN)
        addConstraintsWithFormat( "V:[v0(22)]-8-|", views: saveConnectionBTN)

        
       // addConstraintsWithFormat("H:|-10-[v0(22)]-10-[v1]-10-[v2]-10-|", views: imageView, connectionlbl, connectionBTN)
       // addConstraintsWithFormat("H:|-10-[v0(22)]-10-[v1]-10-|", views: imageView, settingslbl)
//        imageView.leftAnchor.constraint(equalTo: self.leftAnchor)
//        connectionlbl.leftAnchor.constraint(equalTo: imageView.rightAnchor)
//        connectionBTN.leftAnchor.constraint(equalTo: connectionlbl.rightAnchor)
        
        // addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        //  addConstraint(NSLayoutConstraint(item: settingslbl, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        
        
    }
    
   // var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
    
    func AddUpdateConnections() {
       connectionLauncher?.addUpdateConnectionSettings()
    }
    
    func SaveConnections() {
        connectionLauncher?.saveConnectionSettings()
    }
    
    func handleDismiss() {
        connectionLauncher?.handleDismiss()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
