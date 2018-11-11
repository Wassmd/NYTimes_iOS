//
//  NYTimesTableViewController.swift
//  NYTimes
//
//  Created by Mohammed Wasimuddin on 09/11/18.
//  Copyright © 2018 Wasim. All rights reserved.
//

import UIKit

class NYTimesTableViewController: UITableViewController {

    @IBOutlet var loadingView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var items:[News]!
    
    private var dataSource: TableViewDataSource<NewsTableViewCell,News>?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

       let nyTimesModelView = NYTimesListViewModel()
        
        addLoadingViewToTableViewBackground()
        activityIndicator.startAnimating()
        
        nyTimesModelView.fetchMostViewed(section: Constants.urlConstants.SECTION_ALLSECTION, period: Constants.urlConstants.PERIOD_7) { result in
            
            switch result {
                
            case .success(let news):
                print(news)
                self.items = news
                
                self.dataSource = TableViewDataSource(cellIdentifier: "mostViewCell", items: news, configureCell: { (cell, news) in
                    
                    cell.titleLabel.text = news.title
                    cell.descriptionLabel.text = news.abstract
                    cell.dateLabel.text = news.published_date
                    cell.newsImageView.image = UIImage(named: "nytimes")
                })
                
                self.tableView.delegate = self.dataSource
                self.tableView.dataSource = self.dataSource
                self.tableView.reloadData()
                
                break
            case .failure(let error):
                print("\(error)")
                showAlertMessage(self, error.localizedDescription)
                break
            }
        }
    }
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetail" {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
               let aNews = items[indexPath.row]
                let detailController = segue.destination  as! NYNewsDetailsViewController
                detailController.detailItem = aNews
            }
        }
    }
    
    func addLoadingViewToTableViewBackground() {
        
        self.tableView.backgroundView = loadingView
        self.tableView.separatorStyle = .none
    }
}
