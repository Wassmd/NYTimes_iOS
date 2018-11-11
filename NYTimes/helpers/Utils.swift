//
//  Utils.swift
//  NYTimes
//
//  Created by Mohammed Wasimuddin on 10/11/18.
//  Copyright © 2018 Wasim. All rights reserved.
//

import Foundation
import UIKit

extension Date {
    
    //Date formatter  Jan 01, 2018
    static func getDateFromString(dateString:String) -> String{
        
        let dateFormatter = DateFormatter()
        //        dateFormatter.dateFormat = "yyyy-MM-dd HH:MM"
        dateFormatter.dateFormat = "yyyy-MM-dd"

        return dateFormatter.string(from: NSDate() as Date)
    }
}

extension String {
    
    //Date formatter  Jan 01, 2018
     func getDateFromString(withFormat format: String = "yyyy-MM-dd") -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        guard let date = dateFormatter.date(from: self) else {
            
            preconditionFailure("Take a look to your date Format.")
        }
        return date
    }
}

func showAlertMessage(_ vc:UIViewController, title:String = "NY Times News",_ message:String) {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    
    vc.present(alert,animated: true,completion: nil)
}
