//
//  GlobalVariables.swift
//  goCM
//
//  Created by Arturo Plottier on 19/8/17.
//  Copyright © 2017 pac-apps. All rights reserved.
//

import UIKit

class GlobalVars {
   
    
    static let instance = GlobalVars()
    private init() {}

    
    func GlobalBackgroundColor()  -> UIColor {
         return UIColor.rgb(215, green: 230, blue: 239)
    }
    
   
}


struct GlobalArrays {
    static var requestConnectionModel = RequestConnectionModel()
}
