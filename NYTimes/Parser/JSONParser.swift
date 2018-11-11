//
//  JSONParser.swift
//  NYTimes
//
//  Created by Mohammed Wasimuddin on 10/11/18.
//  Copyright © 2018 Wasim. All rights reserved.
//

import Foundation

protocol Parceable {
    
    static func parseObject(dictionary:[String:AnyObject]) -> Result<Self,ErrorResult>
}

final class JSONParser {
    
    static func parseJSONData<T: Parceable>(data: Data, jsonArraykey:String, completion : (Result<[T], ErrorResult>) -> Void) {
        
        var parsedResult:AnyObject? = nil
        
        do {
            
            parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as AnyObject
            
            if let result = parsedResult?[jsonArraykey] as? [AnyObject] {
                
                // init final result
                var finalResult : [T] = []
                
                
                for object in result {
                    if let dictionary = object as? [String : AnyObject] {
                        
                        // check foreach dictionary if parseable
                        switch T.parseObject(dictionary: dictionary) {
                        case .failure(_):
                            continue
                        case .success(let newModel):
                            finalResult.append(newModel)
                            break
                        }
                    }
                }
                
                completion(.success(finalResult))
                
            } else {
                // not an array
                completion(.failure(.parser("Json data is not an array")))
            }
        } catch {
            // can't parse json
            completion(.failure(.parser("Error while parsing json data")))
        }
    }
    
    static func parseJSONData<T: Parceable>(data: Data, completion:(Result<T,ErrorResult>) -> Void) {
        
        do {
            
            if let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:AnyObject] {
                
                switch T.parseObject(dictionary: dictionary) {
                case .success(let responseData):
                    completion(Result.success(responseData))
                    break
                case .failure(let error):
                    completion(Result.failure(error))
                    break
                }
            }else {
                
                completion(Result.failure(ErrorResult.parser("Parsed JSON data is not dict")))
            }
        }catch {
            
            completion(Result.failure(ErrorResult.parser("Error while parsing json data")))
        }
    }
}
