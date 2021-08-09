//
//  RecordModel.swift
//  goCM
//
//  Created by Arturo Plottier on 4/8/17.
//  Copyright © 2017 pac-apps. All rights reserved.
//

import UIKit

class RecordCollection: NSObject {
    var HasMore: Bool?
    var Data : [RecordModel]?
}

class RecordModel: NSObject {
        var Title: String?
        var Id:  IdModel?
        var PropAndFieldVals: [String: AnyObject]?
        var HasItems: Bool?
        var TrimIcon: Int?
        var IsFavourite: Bool?
}

class IdModel: NSObject {
    var ItemType :Int64?
    var Uri: Int64?
}

/*
struct IdModel {
    let ItemType :String
    let Uri: String
    
    init?(json: JSON) {
    guard
      let ItemType = json["ItemType"] as? String,
      let Uri = json["Uri"] as? String
    else {return nil}
    
    self.ItemType = ItemType
    self.Uri = Uri
    }

}
*/
/*
 {
 HasItems = 1;
 Id =  {
        ItemType = "-1";
        Uri = "-101";
        };
 IsFavourite = 0;
 PropAndFieldVals =     {
                        };
 Title = "Project Files";
 TrimIcon = 552;
 },
 
 */


/*
struct RecordModel {
    
    let Title: String
    let Id: [IdModel]
    let PropAndFieldVals: [String: AnyObject]
    let HasItems: Bool
    let TrimIcon: Int
    let IsFavourite: Bool

    init?(json: JSON) {
     guard
         let Id = json["Id"] as? [JSON],
         let Title = json["Title"] as? String,
         let PropAndFieldVals = json["PropAndFieldVals"] as? [String: AnyObject],
         let HasItems = json["HasItems"] as? Bool,
         let TrimIcon = json["TrimIcon"] as? Int,
         let IsFavourite = json["IsFavourite"] as? Bool

            else { return nil }
        
        self.Id = Id.map({ IdModel(json: $0)! })

       // self.Id = Id
        self.Title = Title
        self.PropAndFieldVals = PropAndFieldVals
        self.HasItems = HasItems
        
        
        self.TrimIcon = TrimIcon
        self.IsFavourite = IsFavourite

    }
    
 


    func image(completion: @escaping (UIImage) -> Void) {
      //  if let image = imageCache.image(forKey: id) {
       //     completion(image)
      //  } else {
      //      NetworkingService.shared.downloadImage(fromLink: link) { (image) in
      //          imageCache.add(image, forKey: self.id)
      //          completion(image)
      //      }
       // }
    }
}
 */

