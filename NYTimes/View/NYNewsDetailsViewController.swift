//
//  NYNewsDetailsViewController.swift
//  NYTimes
//
//  Created by Mohammed Wasimuddin on 11/11/18.
//  Copyright © 2018 Wasim. All rights reserved.
//

import UIKit

class NYNewsDetailsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    var detailItem:News? {
        
        didSet {
            
            configureView()
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

         configureView()
    }
    
    func configureView() {
        
        if let detail = detailItem {
            
            if let title = titleLabel {
                title.text = detail.title
            }
            if let label = detailsLabel {
                label.text = detail.abstract
            }
        }
    }
    
}
