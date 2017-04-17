//
//  ViewController.swift
//  PullToRefresh
//
//  Created by Metas Umsuwan on 4/17/2560 BE.
//  Copyright © 2560 Metas Umsuwan. All rights reserved.
//

import UIKit


struct Movie {
    let title:String
    let genre:String
}

class ViewController: UIViewController {
    
    //MARK: poperties
    @IBOutlet weak var tableView: UITableView!

    var movies=[
        Movie(title: "Lion King", genre: "Animation"),
        Movie(title: "Star Wars", genre: "Sci-fi")
    ]
    
    var refreshControl:UIRefreshControl={
        let refreshControl=UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(ViewController.handleRefresh(_:)), for: UIControlEvents.valueChanged)
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title="pull refresh"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.addSubview(self.refreshControl)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleRefresh(_ refreshControl:UIRefreshControl){
        let newMovie=Movie(title: "Serenity", genre: "Sci-fi")
        movies.append(newMovie)
        movies.sort(){$0.title<$1.title}
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
}

extension ViewController:UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return movies.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text=movies[indexPath.row].title
        cell.detailTextLabel?.text=movies[indexPath.row].genre
        return cell
    }
}


