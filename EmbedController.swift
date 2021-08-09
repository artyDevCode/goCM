//
//  EmbedController.swift
//  goCM
//
//  Created by Arturo Plottier on 13/8/17.
//  Copyright © 2017 pac-apps. All rights reserved.
//

import Foundation
import UIKit

class EmbedController {
    
    public private(set) weak var rootViewController: UIViewController?
    
    public private(set) var controllers = [UIViewController]()
    
    init (rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    func append(viewController: UIViewController) {
        if let rootViewController = self.rootViewController {
            controllers.append(viewController)
            rootViewController.addChildViewController(viewController)
            rootViewController.view.addSubview(viewController.view)
        }
    }
    
    deinit {
        if self.rootViewController != nil {
            for controller in controllers {
                controller.view.removeFromSuperview()
                controller.removeFromParentViewController()
            }
            controllers.removeAll()
            self.rootViewController = nil
        }
    }
}
