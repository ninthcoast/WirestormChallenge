//
//  ViewController.swift
//  WirestormChallenge
//
//  Created by Ninth Coast on 1/19/16.
//  Copyright © 2016 Ninth Coast. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let networkController = NetworkController.sharedInstance
    
    @IBOutlet weak var tableView: UITableView!
    var refreshControl: UIRefreshControl! = UIRefreshControl()
    var people: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "People"
        
        // Setup table view
        tableView.dataSource = self
        tableView.delegate   = self
        tableView.registerNib(UINib(nibName: "PersonTableViewCell", bundle: nil), forCellReuseIdentifier: "PersonTableViewCell")
        tableView.separatorStyle = .None
        setUpPullToRefresh()
        
        getPeople()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: People fetching
    
    func getPeople() {
        networkController.getList { (items, error) -> () in
            self.refreshControl.endRefreshing()
            self.people = items
            self.tableView.reloadData()
        }
    }
    
    func setUpPullToRefresh() {
        self.refreshControl.attributedTitle = NSAttributedString(string: "Loading")
        self.refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refreshControl)
    }
    
    func refresh(sender: AnyObject) {
        getPeople()
    }
    
    // MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: PersonTableViewCell? = tableView.dequeueReusableCellWithIdentifier("PersonTableViewCell") as? PersonTableViewCell
        if cell == nil {
            cell = PersonTableViewCell()
        }
        cell!.selectionStyle = UITableViewCellSelectionStyle.None
        cell!.configureWithPerson(people[indexPath.row])
        
        return cell!
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let largePicURL = people[indexPath.row].lrgpic {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            if let fullImageViewController = mainStoryboard.instantiateViewControllerWithIdentifier("ShowFullImageViewController") as? ShowFullImageViewController {
                fullImageViewController.imageURL = largePicURL
                fullImageViewController.title    = people[indexPath.row].name
                navigationController?.pushViewController(fullImageViewController, animated: true)
            }
        }
    }

}

