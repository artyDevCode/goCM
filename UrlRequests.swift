//
//  UrlRequests.swift
//  goCM
//
//  Created by Arturo Plottier on 31/7/17.
//  Copyright © 2017 pac-apps. All rights reserved.
//
import Foundation
import SystemConfiguration
/*
func postDataToURL() {

        let postEndpoint: String = "http://vmh11827.hosting24.com.au:80/default.aspx?a=gc&t=0&u=0&pi=0&ps=50&s=P26&o=0" //"http://requestb.in/pbfw9gpb"
    let url = URL(string: postEndpoint)!
    let session = URLSession.shared
   /* let postParams : [String: AnyObject] = ["textConnection = VMH&" +
        "textGateway = vmh11827.hosting24.com.au&" +
        "boolHTTPS = false&" +
        "boolValidateSSL = false&" +
        "textPort = textPort&" +
        "textUserName = test&" +
        "textPassword = kapish&" +
        "textDomain = VMH11827&" +
        "boolBasicAuth = true&" +
        "textJSONTimeout = 30&" +
        "textFileTimeout = 60" +
        "textPageSize = 50&" +
        "textSortField = Ascending&" +
        "textSortOrder = Title" as AnyObject]*/
    let postParams =  Settings(
        textConnection : "VMH",
        textGateway : "vmh11827.hosting24.com.au",
        boolHTTPS : false,
        boolValidateSSL : false,
        textPort : "80",
        textUserName : "test",
        textPassword : "kapish",
        textDomain : "VMH11827",
        boolBasicAuth : true,
        textJSONTimeout : "30",
        textFileTimeout : "60",
        textPageSize : "50",
        textSortField : "Ascending",
        textSortOrder : "Title")

    // Create the request
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
    do {
        request.httpBody = try JSONSerialization.data(withJSONObject: postParams.toDictionary(), options: JSONSerialization.WritingOptions())
        print(postParams)
    } catch {
        print("bad things happened")
    }
    
    // Make the POST call and handle it in a completion handler
    session.dataTask(with: request, completionHandler: { ( data: Data?, response: URLResponse?, error: Error?) -> Void in
        // Make sure we get an OK response
        guard let realResponse = response as? HTTPURLResponse,
            realResponse.statusCode == 200 else {
                print("Not a 200 response")
                return
        }
        
        // Read the JSON
        if let postString = NSString(data:data!, encoding: String.Encoding.utf8.rawValue) as String? {
            // Print what we got from the call
            //extract_json(data!)
            print("POST: " + postString)
            // self.performSelector(onMainThread: #selector(ViewController.updatePostLabel(_:)), with: postString, waitUntilDone: false)
        }
        
    }).resume()
}
*/

/*
func loadingJSON() -> () { //(_ link:String, postString:String, completionHandler: @escaping (_ JSONObject: AnyObject) -> ()) {

    if(isConnectedToNetwork() == false){
       // completionHandler("-1" as AnyObject)
        return
    }

    
    
    let postEndpoint: String = "http://vmh11827.hosting24.com.au:80/default.aspx?a=gc&t=0&u=0&pi=0&ps=50&s=P26&o=0" //"http://requestb.in/pbfw9gpb"
    let postParams =  Settings(
        textConnection : "VMH",
        textGateway : "vmh11827.hosting24.com.au",
        boolHTTPS : false,
        boolValidateSSL : false,
        textPort : "80",
        textUserName : "test",
        textPassword : "kapish",
        textDomain : "VMH11827",
        boolBasicAuth : true,
        textJSONTimeout : "30",
        textFileTimeout : "60",
        textPageSize : "50",
        textSortField : "Ascending",
        textSortOrder : "Title")

    
    let request = NSMutableURLRequest(url: URL(string: postEndpoint)!)
    request.httpMethod = "POST"
   // request.httpBody = postString.data(using: String.Encoding.utf8)
    do {
        request.httpBody = try JSONSerialization.data(withJSONObject: postParams.toDictionary(), options: JSONSerialization.WritingOptions())
        print(postParams)
    } catch {
        print("bad things happened")
    }

    let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
        guard error == nil && data != nil else {                                                          // check for fundamental networking error
           // print("error=\(error ?? <#default value#>)")
            return
        }
        
        if let httpStatus = response as? HTTPURLResponse , httpStatus.statusCode != 200 {           // check for http errors
            print("statusCode should be 200, but is \(httpStatus.statusCode)")
            //print("response = \(response ?? <#default value#>)")
        }
        
        /*
        //JSON successfull
        do {
            
            let parseJSON = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
            
            DispatchQueue.main.async(execute: {
                completionHandler(parseJSON as AnyObject)
            });
            
            
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
            
        }
 */
    }
    task.resume()
}

*/

/*
func isConnectedToNetwork() -> Bool {
    
    var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
    zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
    zeroAddress.sin_family = sa_family_t(AF_INET)
    
    let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
        $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
            SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
        }
    }
    
    var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
    if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
        return false
    }
    
    let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
    let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
    let ret = (isReachable && !needsConnection)
    
    return ret
    
}
*/
