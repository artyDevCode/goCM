//
//  getConnectionResponse.swift
//  goCM
//
//  Created by Arturo Plottier on 11/9/17.
//  Copyright © 2017 pac-apps. All rights reserved.
//

import Foundation

struct GetConnectionResponse {
   // var requestConnectionModel = [RequestConnectionModel]()
    
    init(json: JSON) throws {
        //for dictionary in json["Data"] as! [String: AnyObject] {
        
            var dictionary = json["Data"] as! [String: AnyObject]
            let record = RequestConnectionModel()
            record.CheckoutOnEdit = dictionary["CheckoutOnEdit"] as? Bool
            record.DBID = dictionary["DBID"] as? String
            record.DisableAddFavourites = dictionary["DisableAddFavourites"] as? Bool
            record.DisableAddNotes = dictionary["DisableAddNotes"] as? Bool
            record.DisableCompleteAction = dictionary["DisableCompleteAction"] as? Bool
            record.DisableEdit = dictionary["DisableEdit"] as? Bool
            record.DisableEmail = dictionary["DisableEmail"] as? Bool
            record.DisableEmailElectronic = dictionary["DisableEmailElectronic"] as? Bool
            record.DisableEmailTR5 = dictionary["DisableEmailTR5"] as? Bool
            record.DisableOfficeEditing = dictionary["DisableOfficeEditing"] as? Bool
            record.DisableOffline = dictionary["DisableOffline"] as? Bool
            record.DisableOfflineRecords = dictionary["DisableOfflineRecords"] as? Bool
            record.DisableOpenIn = dictionary["DisableOpenIn"] as? Bool
            record.DisablePDFEditing = dictionary["DisablePDFEditing"] as? Bool
            record.HPTRIMVer = dictionary["HPTRIMVer"] as? String //= "7.3.3.5645";
            record.MiscClientOptions = dictionary["MiscClientOptions"] as? String //= "";
            record.OfflineRecordsCaption = dictionary["OfflineRecordsCaption"] as? String //= "";
            record.UserName = dictionary["UserName"] as? String //= "";
           // record.goTRIMLic = dictionary["goTRIMLic"] as? GoTRIML
            record.goTRIMVer = dictionary["goTRIMVer"] as? String // "2.5.1.0014";
            record.isLicenced = dictionary["isLicenced"] as? String
        
            
            let goTrimLic = GoTRIML()
            var goTRIMLicDic = dictionary["goTRIMLic"]  as! [String: AnyObject]
            goTrimLic.EvalExpires = goTRIMLicDic["EvalExpires"] as? String
            goTrimLic.IsEval = goTRIMLicDic["IsEval"] as? Bool
            goTrimLic.TRIMLicNum = goTRIMLicDic["TRIMLicNum"] as? String
            goTrimLic.UserCount = goTRIMLicDic["UserCount"] as? Int64
            record.goTRIMLic = goTrimLic

            GlobalArrays.requestConnectionModel = record
            //self.requestConnectionModel.append(record)
        //}
    }
    
}

