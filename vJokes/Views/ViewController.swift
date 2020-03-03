//
//  ViewController.swift
//  vJokes
//
//  Created by pat on 2/21/20.
//  Copyright © 2020 pat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var jokesUILabel: UILabel!
    @IBOutlet weak var shareUILabel: UILabel!
    @IBOutlet weak var reportUILabel: UILabel!
    @IBOutlet weak var downVoteUILabel: UILabel!
    @IBOutlet weak var upVoteUILabel: UILabel!
    
    let displayJokes = DisplayJokesController ()
    let updateJoke = UpdateJokesController()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.displayJokeOnLabel()
        
        
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(displayJokeOnLabel))
        self.jokesUILabel.isUserInteractionEnabled = true
        self.jokesUILabel.addGestureRecognizer(labelTap)
    }
    
    @IBAction func shareBtnTapped(_ sender: UIButton) {
        let newJoke = Joke(joke: "new joke", upVotes: 0, downVotes: 0, reports: 0, shares: 0)
        updateJoke.addJoke(joke: newJoke)
    }
    
    @IBAction func reportBtnTapped(_ sender: UIButton) {
    }
    @IBAction func downVoteBtnTapped(_ sender: UIButton) {
    }
    @IBAction func upVoteBtnTapped(_ sender: UIButton) {
    }
    @objc func displayJokeOnLabel () {
        self.jokesUILabel.text = self.displayJokes.printRandomJoke()
        self.shareUILabel.text = String (self.displayJokes.printShares())
        self.reportUILabel.text = String (self.displayJokes.printReports())
        self.downVoteUILabel.text = String (self.displayJokes.printDownVotes())
        self.upVoteUILabel.text = String (self.displayJokes.printUpVotes())
    }
    
    
}

