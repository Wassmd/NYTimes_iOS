//
//  NYTimesServices.swift
//  NYTimes
//
//  Created by Mohammed Wasimuddin on 10/11/18.
//  Copyright © 2018 Wasim. All rights reserved.
//

import Foundation

protocol NYTimesServicesProtocol : class {
    
    func fetchMostViewedNews(section:String, period:String, _ completion: @escaping ((Result<[News], ErrorResult>) -> Void))
}

final class NYTimesServices : RequestHandler, NYTimesServicesProtocol {
    
    static let shared = NYTimesServices()
    
    let apiEndPoint = Constants.urlConstants.BASE_URL + Constants.urlConstants.SECTION_ALLSECTION + Constants.urlConstants.PERIOD_7 + Constants.urlConstants.API_KEY+Constants.urlConstants.API_KEY_VALUE
    
    var task : URLSessionTask?
    
    func fetchMostViewedNews(section:String, period:String, _ completion: @escaping ((Result<[News], ErrorResult>) -> Void)) {
        
        let apiEndPoint = Constants.urlConstants.BASE_URL + section + period + Constants.urlConstants.API_KEY+Constants.urlConstants.API_KEY_VALUE
        
        // cancel previous request if already in progress
        self.cancelFetchTask()
        
        task = NetworkService().requestGETMethodAPI(apiEndPoint, completionHandlerForGET: self.networkResult(jsonArrayKey:Constants.JSONResponseKey.NEWS_RESULTS,completion: completion))
    }
    
    func cancelFetchTask() {
        
        if let task = task {
            task.cancel()
        }
        task = nil
    }
}
