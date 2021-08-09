//
//  NetworkService.swift
//  goCM
//
//  Created by Arturo Plottier on 4/8/17.
//  Copyright © 2017 pac-apps. All rights reserved.
//

import UIKit
typealias JSON = [String: Any]

class NetworkService {
    
    static let instance = NetworkService()
    private init() {}
    //		xhr.setRequestHeader('Authorization', 'Basic ' + Ti.Utils.base64encode(props.getDomain().toUpperCase() + '\\' + props.getUsername().toLowerCase() + ':' + props.getPassword()));

//    func httpRequests(settingsConnection: SettingsConnection, success successBlock: @escaping (GetResponse) -> Void) {
//        let session: URLSession
//        
//        let config = URLSessionConfiguration.default
//        if (settingsConnection.boolBasicAuth) {
//            let userPasswordData = "\(String(describing: settingsConnection.textUserName)):\(String(describing: settingsConnection.textPassword))".data(using: .utf8)
//            let base64EncodedCredential = userPasswordData!.base64EncodedString(options: Data.Base64EncodingOptions.init(rawValue: 0))
//            let authString = "Basic \(base64EncodedCredential)"
//            config.httpAdditionalHeaders = ["Authorization" : authString]
//            session = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue())
//        }
//        guard let url = URL(string: "http://vmh11827.hosting24.com.au:80/default.aspx?a=gc&t=0&u=0&pi=0&ps=50&s=P26&o=0") else { return }
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
//        
//        session.dataTask(with: request) { (data, response, error) in
//            guard let data = data else {return }
//            if let httpStatus = response as? HTTPURLResponse , httpStatus.statusCode != 200 {           // check for http errors
//                print("statusCode should be 200, but is \(httpStatus.statusCode)")
//            }
//            
//            do{
//                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? JSON else {return}
//                print(json)
//                
//                let getResponse = try GetResponse(json: json)
//                DispatchQueue.main.async {
//                    successBlock(getResponse)
//                }
//            }catch let error as NSError {
//                print("Failed to load: \(error.localizedDescription)")
//            }
//            }.resume()
//        
//    }

    func httpRequestConnection(settingsConnection: SettingsConnection, httpAdditionalString : String, success successBlock: @escaping (GetConnectionResponse) -> Void) {
      

       // let loginData = String(format: "%@:%@", settingsConnection.textUserName, settingsConnection.textPassword).data(using: String.Encoding.utf8)!
        let loginData = "\(String(describing: settingsConnection.textUserName)):\(String(describing: settingsConnection.textPassword))".data(using: .utf8)
        let base64LoginData = loginData?.base64EncodedString()
        
        // create the request
        let httpString :String = settingsConnection.boolHTTPS ? "https://" : "http://"
        let gatewayString : String = settingsConnection.textGateway!
        let pageSize :String = settingsConnection.textPageSize!
        let sortOrder : String = settingsConnection.textSortOrder == "Ascending" ? "1" : "0"
        let sortField :String = settingsConnection.textSortField!

        let URLConnection = "\(httpString + gatewayString)/default.aspx?ps=\(pageSize)&o=\(sortOrder)&s=\(sortField)&\(httpAdditionalString)"
        
        let url = URL(string: URLConnection)!  //"http://vmh11827.hosting24.com.au:80/default.aspx?a=sp")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = Double(settingsConnection.textJSONTimeout!)!
        request.setValue("Basic \(String(describing: base64LoginData))", forHTTPHeaderField: "Authorization")
        
        //making the request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
           // print("status code = \(String(describing: response as? HTTPURLResponse))")
            if let error = error {
                print("error: \(error)")
                DispatchQueue.main.async {
                    DisplayMessage.instance.showMessage(message: "Error Connecting to the Server", color: .red)
                }
            }
            guard let data = data else { return }
            if let httpStatus = response as? HTTPURLResponse , httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
            }
            
            do{
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? JSON else {return}
                print(json)
                
                let getConnectionResponse = try GetConnectionResponse(json: json)
                DispatchQueue.main.async {
                    successBlock(getConnectionResponse)
                }
            }catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }

        }
        task.resume()
    }
    func httpRequests(settingsConnection: SettingsConnection!, httpAdditionalString: String, success successBlock: @escaping (GetResponse) -> Void) {
        let session = URLSession.shared

        let loginData = "\(String(describing: settingsConnection.textUserName)):\(String(describing: settingsConnection.textPassword))".data(using: .utf8)
        let base64LoginData = loginData?.base64EncodedString()
        
        // create the request
        let httpString :String = settingsConnection.boolHTTPS ? "https://" : "http://"
        let gatewayString : String = settingsConnection.textGateway!
        let pageSize :String = settingsConnection.textPageSize!
        let sortOrder : String = settingsConnection.textSortOrder == "Ascending" ? "1" : "0"
        let sortField :String = settingsConnection.textSortField!
        
        let URLConnection = "\(httpString + gatewayString)/default.aspx?ps=\(pageSize)&o=\(sortOrder)&s=\(sortField)\(httpAdditionalString)"

        let url = URL(string: URLConnection)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = Double(settingsConnection.textJSONTimeout!)!
        request.setValue("Basic \(String(describing: base64LoginData))", forHTTPHeaderField: "Authorization")

        
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data else {return }
            if let httpStatus = response as? HTTPURLResponse , httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
            }

            do{
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? JSON else {return}
                print(json)
                
                let getResponse = try GetResponse(json: json)
                DispatchQueue.main.async {
                     successBlock(getResponse)
                }
            }catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
        }.resume()
        
    }
    
    
}
