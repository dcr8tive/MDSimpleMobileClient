//
//  MDTwitterViewController.swift
//  MDTwitterClient
//
//  Created by MDLE on 2019-03-30.
//  Copyright © 2019 dcre8tive. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

protocol Tweetable: class {
    func didTweet(tweet: Tweet)
}

class MDTwitterViewController: UIViewController, MDStoryboardable, UITableViewDelegate, UITableViewDataSource {
 
    
    weak var coordinator: MDTwitterCoordinator?
    var tweets = [Tweet]()
    @IBOutlet var tableView: UITableView!
    private let refreshControl = UIRefreshControl()
    
    private func setupNavigationBar() {
        //Screen title
        self.title = "Main"
        
        //Add Tweet button
        let tweetButton = UIBarButtonItem(title: "Tweet", style: UIBarButtonItem.Style.plain, target: self, action: #selector(tweetTapped(_:)))
        self.navigationItem.rightBarButtonItem = tweetButton
        
        //Add Logout button
        let logoutButton = UIBarButtonItem(title: "Logout", style: UIBarButtonItem.Style.plain, target: self, action: #selector(logout(_:)))
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = logoutButton
    }
    
    //Load local db if existed some
    private func loadingData() {
        tweets = RealmHelper.getObjects()
    }
    
    //Simulation getting data from server with delay 2 seconds
    @objc func loadNewData(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let tweet = Tweet()
            tweet.text = Lorem.shortTweet
            tweet.owner = Lorem.fullName
            self.tweets.insert(tweet, at: 0)
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    
    @objc func tweetTapped(_ sender: Any) {
        let vc = MDTweetMessageViewController.instantiate()
        vc.delegate = self
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    @objc func logout(_ sender: Any) {
        coordinator?.didFinishShowing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setup Navbar
        self.setupNavigationBar()
        
        //Loading old tweets
        self.loadingData()
        
        //Make the table nicer with empty space
        tableView.tableFooterView = UIView(frame: .zero)
        
        //Add refresh control and config
        tableView.refreshControl = refreshControl;
        refreshControl.addTarget(self, action: #selector(loadNewData(_:)), for: .valueChanged)
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellReuseIdentifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! MDCustomTableCell
        
        //Main tweet message
        cell.tweetMessage?.text = tweets[indexPath.row].text
        //Details tweet message
        cell.tweetdetail?.text = tweets[indexPath.row].descriptions()
        
        return cell
    }
}

extension MDTwitterViewController: Tweetable {
    func didTweet(tweet: Tweet) {
        tweets.insert(tweet, at: 0)
        tableView.reloadData()
        //Write into db
        RealmHelper.saveObject(object: tweet)
    }
}
