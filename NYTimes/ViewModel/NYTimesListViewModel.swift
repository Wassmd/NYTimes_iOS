//
//  NYTimesListViewModel.swift
//  NYTimes
//
//  Created by Mohammed Wasimuddin on 09/11/18.
//  Copyright © 2018 Wasim. All rights reserved.
//

import Foundation
import UIKit

struct NYTimesListViewModel {
    
    private weak var service: NYTimesServicesProtocol?
    
    init(service: NYTimesServicesProtocol = NYTimesServices.shared) {
        
        self.service = service
    }
    
    func fetchMostViewed(section: String,period: String, _ completion: @escaping ((Result<[News],ErrorResult>)) -> Void) {
        
        self.service?.fetchMostViewedNews(section: section, period: period,{ result in
            
            DispatchQueue.main.async {
                
                switch result {
                    
                case .success(let news):
                  //  print(news)
                    completion(Result.success(news))
                    break
                case .failure(let error):
                  //  print("\(error)")
                    completion(Result.failure(error))
                    break
                }
            }
            
        })
        
        
    }
}
