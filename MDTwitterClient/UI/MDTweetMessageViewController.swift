//
//  MDTweetMessageViewController.swift
//  MDTwitterClient
//
//  Created by MDLE on 2019-03-30.
//  Copyright © 2019 dcre8tive. All rights reserved.
//

import Foundation
import UIKit

class MDTweetMessageViewController: UIViewController, MDStoryboardable, UITextViewDelegate {

    
    @IBOutlet weak var textView: UITextView?
    weak var delegate: Tweetable!
    
    private func setupNavigationBar() {
        //Screen title
        self.title = "Your Tweet Message"
        
        //Add Send Tweet button
        let sendButton = UIBarButtonItem(title: "Send", style: UIBarButtonItem.Style.plain, target: self, action: #selector(sendTweetTapped(_:)))
        self.navigationItem.rightBarButtonItem = sendButton
        
        //Add Cancel button
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancelTapped(_:)))
        self.navigationItem.leftBarButtonItem = cancelButton
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
    }
    

    
    @objc func cancelTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func sendTweetTapped(_ sender: Any) {
        let tweet = Tweet()
        tweet.text  = textView?.text
        tweet.owner = Lorem.fullName
        delegate?.didTweet(tweet: tweet)
        self.dismiss(animated: true, completion: nil)
    }
    
}
