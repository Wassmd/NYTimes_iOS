//
//  NewsTableViewCell.swift
//  NYTimes
//
//  Created by Mohammed Wasimuddin on 11/11/18.
//  Copyright © 2018 Wasim. All rights reserved.
//

import Foundation
import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
}
