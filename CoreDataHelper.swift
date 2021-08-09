//
//  CoreDataHelper.swift
//  goCM
//
//  Created by Arturo Plottier on 9/9/17.
//  Copyright © 2017 pac-apps. All rights reserved.
//

import Foundation
import CoreData

class CoreDataHelper {
    
    static let instance = CoreDataHelper()
    private init() {}
    var settingsConnection = [SettingsConnection]()
    
//    func getCoreDataSettings() -> [SettingsConnection] {
//
//        do {
//            let settingsConnection = try PersistenceService.context.fetch(fetchRequest)
//            //self.settingsConnection = settingsConnection
//            return settingsConnection
//        }
//        catch {}
//        return settingsConnection
//    }
    
    
    //Boolean to get default connection for statup of application
    func getCoreDataSettings(completionHandler: @escaping (_ success: [SettingsConnection]?) -> Void) {
        DispatchQueue.main.async(execute: { () -> Void in
            let fetchRequest: NSFetchRequest<SettingsConnection> = SettingsConnection.fetchRequest()
            do {
                let settingsConnection = try PersistenceService.context.fetch(fetchRequest)
                completionHandler(settingsConnection)
            }
            catch {
                fatalError("Failed to fetch Connection Settings: \(error)")
            }
        })
    }
    
    func getDefaultCoreDataSettings(completionHandler: @escaping (_ success: SettingsConnection?) -> Void) {
        DispatchQueue.main.async(execute: { () -> Void in
            let fetchRequest: NSFetchRequest<SettingsConnection> = SettingsConnection.fetchRequest()
            do {
                let settingsConnection = try PersistenceService.context.fetch(fetchRequest)
                if (settingsConnection.count > 0) {
                    for settCon in settingsConnection
                    {
                        if (settCon.boolDefault) {
                            completionHandler(settCon as SettingsConnection)
                        }
                    }
                }
                else {
                    let settConn :SettingsConnection? = nil
                    completionHandler(settConn)
                }
                
            }
            catch {
                fatalError("Failed to fetch Connection Settings: \(error)")
            }

        })
    }

}
