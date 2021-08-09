//
//  RequestModel.swift
//  goCM
//
//  Created by Arturo Plottier on 11/9/17.
//  Copyright © 2017 pac-apps. All rights reserved.
//

import UIKit

class RequestConnectionModel: NSObject {
    var CheckoutOnEdit: Bool? // = 1;
    var DBID : String? //= DB;
    var DisableAddFavourites: Bool? // = 0;
    var DisableAddNotes : Bool? // = 0;
    var DisableCompleteAction : Bool? // = 0;
    var DisableEdit : Bool? // = 0;
    var DisableEmail : Bool? // = 0;
    var DisableEmailElectronic : Bool? // = 0;
    var DisableEmailTR5 : Bool? // = 0;
    var DisableOfficeEditing : Bool? // = 0;
    var DisableOffline : Bool? // = 0;
    var DisableOfflineRecords:  Bool? // = 0;
    var DisableOpenIn : Bool? // = 0;
    var DisablePDFEditing : Bool? // = 0;
    var HPTRIMVer :String? //= "7.3.3.5645";
    var MiscClientOptions :String? //= "";
    var OfflineRecordsCaption :String? //= "";
    var UserName :String? //= "";
    var goTRIMLic : GoTRIML?
    var goTRIMVer : String? // "2.5.1.0014";
    var isLicenced : String? // = True;

    
//    var Title: String?
//    var goTRIMLic:  goTRIML?
//    var PropAndFieldVals: [String: AnyObject]?
//    var HasItems: Bool?
//    var TrimIcon: Int?
//    var IsFavourite: Bool?
}

class GoTRIML: NSObject {
    var EvalExpires : String? // "/Date(-2209201200000)/";
    var IsEval : Bool? // 0;
    var TRIMLicNum : String? //= 111111;
    var UserCount : Int64? //= 1000;

}

//CheckoutOnEdit = 1;
//DBID = DB;
//DisableAddFavourites = 0;
//DisableAddNotes = 0;
//DisableCompleteAction = 0;
//DisableEdit = 0;
//DisableEmail = 0;
//DisableEmailElectronic = 0;
//DisableEmailTR5 = 0;
//DisableOfficeEditing = 0;
//DisableOffline = 0;
//DisableOfflineRecords = 0;
//DisableOpenIn = 0;
//DisablePDFEditing = 0;
//HPTRIMVer = "7.3.3.5645";
//MiscClientOptions = "";
//OfflineRecordsCaption = "";
//UserName = "";
//goTRIMLic =     {
//    EvalExpires = "/Date(-2209201200000)/";
//    IsEval = 0;
//    TRIMLicNum = 111111;
//    UserCount = 1000;
//};
//goTRIMVer = "2.5.1.0014";
//isLicenced = True;
//}, "HasMore": 0]
