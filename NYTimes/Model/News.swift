//
//  News.swift
//  NYTimes
//
//  Created by Mohammed Wasimuddin on 09/11/18.
//  Copyright © 2018 Wasim. All rights reserved.
//

import Foundation

struct News {
    
    let title :String
    let abstract:String?
    let published_date:String
    let url:String?
}

extension News: Parceable {
    
    static func parseObject(dictionary: [String : AnyObject]) -> Result<News, ErrorResult> {
        
        if let title = dictionary["title"] as? String,
            let published_date = dictionary["published_date"] as? String {
            
            
            let news = News(title: title, abstract:dictionary["abstract"] as? String , published_date: published_date, url:dictionary["url"] as? String )
            
            return Result.success(news)
        }else {
            
            return Result.failure(ErrorResult.parser("Unable to parse the news"))
        }
    }
    
    
    
}
