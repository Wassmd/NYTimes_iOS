//
//  TableViewDataSource.swift
//  NYTimes
//
//  Created by Mohammed Wasimuddin on 11/11/18.
//  Copyright © 2018 Wasim. All rights reserved.
//

import Foundation
import UIKit

class TableViewDataSource<Cell:UITableViewCell,T>:NSObject, UITableViewDataSource,UITableViewDelegate {
    
    private var cellIdentifier:String!
    var items:[T]!
    var configureCell: (Cell,T) -> ()
    
    init(cellIdentifier:String,items:[T],configureCell: @escaping (Cell,T) -> ()) {
        
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! Cell
        let item = self.items[indexPath.row]
        self.configureCell(cell,item)
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        return UITableView.automaticDimension
//    }
//    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        return 44.0
//    }
}
