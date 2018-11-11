//
//  Constants.swift
//  NYTimes
//
//  Created by Mohammed Wasimuddin on 09/11/18.
//  Copyright © 2018 Wasim. All rights reserved.
//

import Foundation

struct Constants {
    
    struct urlConstants {
        
        // MARK: URLs Constants
        //API
//        static let BASE_URL = "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/30.json?api-key="
        static let BASE_URL = "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/"
        static let SECTION_ALLSECTION = "all-sections/"
        static let PERIOD_7 = "7.json?"
        static let API_KEY = "api-key="
        static let API_KEY_VALUE = "8e70eac593214d2fba53fdc1a27867a2"
        
        //response time out
        static let TIME_OUT = 30.0
    }
    
    struct JSONBodyKeys {
        
        static let USERNAME = "username"
        static let PASSWORD = "password"
        
        static let TITLE = "title"
        static let DESCRIPTION = "description"
        static let SOURCE_CODE = "source_code"
        static let LASTUPDATE_DATE = "lastupdate_date"
        static let IMAGE_PATH = "image_path"
    }
    
    struct JSONResponseKey {
        
        // MARK: Results
        static let NEWS_RESULTS = "results"
        static let ACCOUNT_EXISTS = "account_exists"
        static let results = "owned_pasta"
        static let LATEST_PASTAS = "latest_pastas"
        
    }
    
    struct ErrorCodeConstants {
        
        static let unauthorizedCode = 401;
        static let serverNotFoundCode = 404;
        static let internalServerErrorCode = 500;
        
        /*Move error code should come here*/
    }
    
    struct cacheContants {
        
        static let LOGIN_VALIDITY = "login_validity"
    }
}
