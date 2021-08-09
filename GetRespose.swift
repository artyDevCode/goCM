//
//  GetRespose.swift
//  goCM
//
//  Created by Arturo Plottier on 4/8/17.
//  Copyright © 2017 pac-apps. All rights reserved.
//

import UIKit

struct GetResponse {
    var recordModel = [RecordModel]()
    var recordCollection = RecordCollection()
    
    init(json: JSON) throws {
        
    //  self.recordModel = recordM
        //let recordCollection = RecordCollection()
        recordCollection.HasMore = json["HasMore"] as? Bool
        
        for dictionary in json["Data"] as! [[String: AnyObject]] {
            let record = RecordModel()
            record.HasItems = dictionary["HasItems"] as? Bool
            record.IsFavourite = dictionary["IsFavourite"] as? Bool
            record.Title = dictionary["Title"] as? String
            record.TrimIcon = dictionary["TrimIcon"] as? Int
            
            let IdModelDic = dictionary["Id"] as! [String: AnyObject]
            
            let idModel = IdModel()
            idModel.ItemType = IdModelDic["ItemType"] as? Int64
            idModel.Uri = IdModelDic["Uri"] as? Int64
            record.Id = idModel
            
            
            let PropAndFieldValsDic = dictionary["PropAndFieldVals"] as! [String: AnyObject]
            record.PropAndFieldVals = PropAndFieldValsDic
            
            self.recordModel.append(record)

        }
        recordCollection.Data = self.recordModel
    }

}


/*
class GetResponseObject : NSObject{
    
    var recordModel: [RecordModel]?
    
    func GetResponse(json: JSON) {
        
            self.recordModel = [RecordModel]()
        
            for dictionary in json["Data"] as! [[String: AnyObject]] {
                
                let record = RecordModel()
                record.HasItems = dictionary["HasItems"] as? Bool
                record.IsFavourite = dictionary["IsFavourite"] as? Bool
                record.Title = dictionary["Title"] as? String
                record.TrimIcon = dictionary["TrimIcon"] as? Int
              //  record.PropAndFieldVals = dictionary["PropAndFieldVals"] as! [String: AnyObject]
               
                let IdModelDic = dictionary["Id"] as! [String: AnyObject]
                
                let idModel = IdModel()
                idModel.ItemType = IdModelDic["ItemType"] as? String
                idModel.Uri = IdModelDic["Uri"] as? String
                record.Id = idModel
                
                
                let PropAndFieldValsDic = dictionary["PropAndFieldVals"] as! [String: AnyObject]
                record.PropAndFieldVals = PropAndFieldValsDic
                
                
                return self.recordModel?.append(record)
            }
    }
}
 */
