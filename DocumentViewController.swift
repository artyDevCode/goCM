//
//  DocumentViewController.swift
//  goCM
//
//  Created by Arturo Plottier on 6/8/17.
//  Copyright © 2017 pac-apps. All rights reserved.
//

import UIKit

class DocumentViewController: UIViewController {

    //var itemModel = [ItemModel]()
    var isMenuOpen = true
    var isSettingsOpen = false
    var isConnectionOpen = false
    let subView = UIView()
    
    
   // private var embedController: EmbedController?

   // var newViewController = MainViewController()

    //Start the HomeLauncher
    lazy var homeLauncher: HomeLauncher = {
        let launcher = HomeLauncher()
        launcher.documentController = self
        return launcher
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            self.view.backgroundColor = .white
            setMenuBar()
            showHomeLuncherUI()
    }
   
  //  lazy var mainViewController: MainViewController = {
  //      let launcher = MainViewController()
  //      launcher.documentController = self
  //      return launcher
  //  }()

    
   // let menuBarBackground : UIView = {
   //
   //     let mbView = UIView()
   //     mbView.backgroundColor = GlobalVars.instance.GlobalBackgroundColor()
   //     return mbView
  //  }()

    
    func showDocumentUI() {
        setMenuBar()
        showHomeLuncherUI()
    }
    
    lazy var menuBar: DocumentMenuBar = {
        let mb = DocumentMenuBar()
        mb.documentViewController = self
        return mb
    }()

    /*
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let firstTouch = touches.first {
            let hitView = self.view.hitTest(firstTouch.location(in: self.view), with: event)
            
            if hitView === self {
                print("touch is inside")
            } else {
                toggleMainListMenu()
                print("touch is outside")
            }
        }
    }
    */
    func showHomeLuncherUI() {
        homeLauncher.ShowUI()
    }
    
    func setMenuBar() {
      //  view.addSubview(menuBarBackground)
       // view.addConstraintsWithFormat( "H:|[v0]|", views: menuBarBackground)
     //   view.addConstraintsWithFormat( "V:|[v0(64)]", views: menuBarBackground)
        print(view.frame.width)
        view.addSubview(menuBar)
        view.addConstraintsWithFormat( "H:|[v0]|", views: menuBar) //( "H:[v0(\(view.frame.width / 2))]|", views: menuBar)
        view.addConstraintsWithFormat( "V:|[v0(64)]", views: menuBar)
    }

      
   // override func viewDidAppear(_ animated: Bool) {
       // self.performSegue(withIdentifier: "DocumentViewControllerSegue", sender: self)
   // }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func settingsAction() {
 //       self.newViewController.view.frame = CGRect(origin: CGPoint(x: -320, y: 0), size: CGSize(width: 320, height: self.view.frame.height))
        
    }

    
    @objc func toggleMainListMenu() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
      //  if let window = UIApplication.shared.keyWindow {
                if self.isMenuOpen {
                   // self.newViewController.view.frame = CGRect(origin: CGPoint(x: -320, y: 0), size: CGSize(width: 320, height: self.view.frame.height))
                }
                else {
                  //  self.blackView.backgroundColor = UIColor(white: 0, alpha: 0.3)
                  //  window.addSubview(self.blackView)
                  //  self.blackView.frame = window.frame
                  //  self.blackView.alpha = 0

                   // self.newViewController.view.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 320, height: self.view.frame.height))
                }
                UIView.animate(withDuration: 0.5) {
                    self.view.layoutIfNeeded()
                }
                self.isMenuOpen = !self.isMenuOpen
         //   }
        }, completion: nil)
        
    }
    
    /*
    @objc func toggleSettingsMenu() {
        if isSettingsOpen {
            SettingsVC.constant = -320
        }
        else {
            SettingsVC.constant = 0
        }
        isSettingsOpen = !isSettingsOpen
        
    }

    @objc func toggleConnectionMenu() {
            if isConnectionOpen {
                ConnectionVC.constant = -320
            }
            else {
                ConnectionVC.constant = 0
            }
            isConnectionOpen = !isConnectionOpen
    }

   */

}
