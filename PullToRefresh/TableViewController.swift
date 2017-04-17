//
//  TableViewController.swift
//  PullToRefresh
//
//  Created by Metas Umsuwan on 4/17/2560 BE.
//  Copyright © 2560 Metas Umsuwan. All rights reserved.
//

import UIKit

struct Movie1{
    let name:String
    let gener:String
}

class TableViewController: UITableViewController {
    
    var movies=[
        Movie1(name: "star war", gener: "sci fi"),
        Movie1(name: "inception", gener: "drama")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.refreshControl?.addTarget(self, action: #selector(ViewController.handleRefresh(_:)), for: UIControlEvents.valueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text=movies[indexPath.row].name
        return cell
    }
    
    func handleRefresh(_ refreshControl:UIRefreshControl){
        let newMovie=Movie1(name: "Serentiy", gener: "sci fi")
        movies.append(newMovie)
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }

   
}
