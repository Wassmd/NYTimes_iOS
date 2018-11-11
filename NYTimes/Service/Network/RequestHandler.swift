//
//  RequestHandler.swift
//  NYTimes
//
//  Created by Mohammed Wasimuddin on 10/11/18.
//  Copyright © 2018 Wasim. All rights reserved.
//

import Foundation

class RequestHandler {
    
    func networkResult<T: Parceable>(completion: @escaping((Result<T, ErrorResult>) -> Void)) ->
        ((Result<Data,ErrorResult>) -> Void)  {
            
            return { dataResult in
                
                DispatchQueue.global(qos: .background).async(execute: {
                    
                    switch dataResult {
                    case .success(let data):
                        JSONParser.parseJSONData(data: data, completion: completion)
                        break
                        
                    case .failure(let error):
                        print("Network error \(error)")
                        completion(Result.failure(ErrorResult.network("Network error"+error.localizedDescription)))
                        break
                    }
                })
                
            }
    }
    
    func networkResult<T: Parceable>(jsonArrayKey: String, completion: @escaping((Result<[T], ErrorResult>) -> Void)) ->
        ((Result<Data,ErrorResult>) -> Void)  {
            
            return { dataResult in
                
                DispatchQueue.global(qos: .background).async(execute: {
                    
                    switch dataResult {
                    case .success(let data):
                        JSONParser.parseJSONData(data: data,jsonArraykey:jsonArrayKey, completion: completion)
                        break
                        
                    case .failure(let error):
                        print("Network error \(error)")
                        completion(Result.failure(ErrorResult.network("Network error"+error.localizedDescription)))
                        break
                    }
                })
                
            }
    }
    
    
}
