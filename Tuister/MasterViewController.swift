//
//  MasterViewController.swift
//  Tuister
//
//  Created by Pablo Bendersky on 1/11/16.
//  Copyright © 2016 Pablo Bendersky. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var tweets: [Tweet]?

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerNib(UINib(nibName: "TweetCellView", bundle: nil), forCellReuseIdentifier: "TweetCell")
    }
    
    override func viewDidAppear(animated: Bool) {
        let tuister = Tuister()
        tuister.ensureAccessToAccounts { [weak self] (granted: Bool) -> Void in
            tuister.search(tuister.firstAccount()!, term: "nsconfarg", completion: { (tweets: [Tweet]) -> Void in
                self?.tweets = tweets
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self?.tableView.reloadData()
                })
            })
        }
        super.viewDidAppear(animated)
    }

    // MARK: - Segues

//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "showDetail" {
//            if let indexPath = self.tableView.indexPathForSelectedRow {
//                let object = objects[indexPath.row] as! NSDate
//                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
//                controller.detailItem = object
//                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
//                controller.navigationItem.leftItemsSupplementBackButton = true
//            }
//        }
//    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let tweets = self.tweets else { return 0 }
        
        return tweets.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TweetCell", forIndexPath: indexPath) as! TweetTableViewCell

        let tweet = tweets![indexPath.row]
        cell.update(tweet)
        
        cell.layoutMargins = UIEdgeInsetsZero
        return cell
    }

}

