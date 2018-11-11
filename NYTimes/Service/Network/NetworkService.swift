//
//  NetworkService.swift
//  NYTimes
//
//  Created by Mohammed Wasimuddin on 09/11/18.
//  Copyright © 2018 Wasim. All rights reserved.
//

import Foundation

class NetworkService {
    
    // shared session
    private var session = URLSession.shared
    
    // MARK: Generic POST call
    
    /* Generic POST Method server call
     - Parameter method: POST
     - Parameter parameters: to make query of URL
     - Parameter completionHandlerForPOST: block to send data back
     */
    @discardableResult func requestPOSTMethodAPI(_ urlString: String, jsonBody: String, completionHandlerForPOST: @escaping (Result<Data, ErrorResult>) -> Void) -> URLSessionDataTask {
        
        /* Prepare the URL, Configure the request */
        let request =  NSMutableURLRequest(url:URL(string: urlString)!, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: Constants.urlConstants.TIME_OUT)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonBody.data(using: String.Encoding.utf8)
        
        //to debug the url
        print(request.description)
        
        /* make POST request call*/
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            func sendError(_ error: String,_ code: Int) {
                
                // print(code)
                //completionHandlerForPOST(nil,NSError(domain: "requestPOSTMethodAPI", code: code, userInfo: userInfo))
                completionHandlerForPOST(Result.failure(ErrorResult.network("Wrong url format")))
            }
            
            guard error == nil else {
                
                let errorCode = (error! as NSError).code
                print("error code ",errorCode)
                sendError("There was an error with your request: \(String(describing: error))",errorCode)
                return
            }
            
            /* GUARD: Check for successful response*/
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
                
                sendError("Your request returned a status code other than 200 - 299!",(response as! HTTPURLResponse).statusCode)
                return
            }
            
            /*GUARD was there any data return*/
            guard let data = data else {
                
                sendError("No data returned by the request!",0)
                return
            }
            
            completionHandlerForPOST(Result.success(data))
            print(String(data: data, encoding: String.Encoding.utf8) ?? "No data")
        }
        
        task.resume()
        
        return task
        
    }
    
    
    /* Generic GET Method server call
     - Parameter method: GET
     - Parameter parameters: to make query of URL
     - Parameter completionHandlerForGET: block to send data back
     */
    @discardableResult func requestGETMethodAPI(_ urlString: String, completionHandlerForGET: @escaping (Result<Data, ErrorResult>) -> Void) -> URLSessionDataTask {
        
        /* Prepare the URL, Configure the request */
        let request =  URLRequest(url:URL(string: urlString)!, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: Constants.urlConstants.TIME_OUT)
        
        //to debug the url
        print(request.description)
        
        /* make POST request call*/
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            func sendError(_ error: String,_ code: Int) {
                
                // print(code)
                //completionHandlerForPOST(nil,NSError(domain: "requestPOSTMethodAPI", code: code, userInfo: userInfo))
                completionHandlerForGET(Result.failure(ErrorResult.network("Wrong url format")))
            }
            
            guard error == nil else {
                
                let errorCode = (error! as NSError).code
                print("error code ",errorCode)
                sendError("There was an error with your request: \(String(describing: error))",errorCode)
                return
            }
            
            /* GUARD: Check for successful response*/
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
                
                sendError("Your request returned a status code other than 200 - 299!",(response as! HTTPURLResponse).statusCode)
                return
            }
            
            /*GUARD was there any data return*/
            guard let data = data else {
                
                sendError("No data returned by the request!",0)
                return
            }
            
            print(String(data: data, encoding: String.Encoding.utf8) ?? "No data")
            completionHandlerForGET(Result.success(data))
            
        }
        
        task.resume()
        
        return task
        
    }
    
}
