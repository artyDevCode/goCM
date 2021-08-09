//
//  SettingsConnection+CoreDataProperties.swift
//  
//
//  Created by Arturo Plottier on 4/9/17.
//
//

import Foundation
import CoreData


extension SettingsConnection {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SettingsConnection> {
        return NSFetchRequest<SettingsConnection>(entityName: "SettingsConnection")
    }

    @NSManaged public var textConnection: String?
    @NSManaged public var textGateway: String?
    @NSManaged public var boolHTTPS: Bool
    @NSManaged public var boolValidateSSL: Bool
    @NSManaged public var textPort: String?
    @NSManaged public var textUserName: String?
    @NSManaged public var textPassword: String?
    @NSManaged public var textDomain: String?
    @NSManaged public var boolBasicAuth: Bool
    @NSManaged public var textJSONTimeout: String?
    @NSManaged public var textFileTimeout: String?
    @NSManaged public var textPageSize: String?
    @NSManaged public var textSortField: String?
    @NSManaged public var textSortOrder: String?

}
