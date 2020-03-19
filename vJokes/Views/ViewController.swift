//
//  ViewController.swift
//  vJokes
//
//  Created by pat on 2/21/20.
//  Copyright © 2020 pat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var viewUIView: UIView!
    @IBOutlet weak var jokesUILabel: UILabel!
    @IBOutlet weak var printUIButton: UIButton!
    @IBOutlet weak var votesUILabel: UILabel!
    @IBOutlet weak var likeUIButton: UIButton!
    @IBOutlet weak var dislikeUIButton: UIButton!
    
    let jokesRequest = Jokes()
    var random: Int?
    var votes = 0
    var joke = ""
    var jokesData : [[String: Any]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        jokesRequest.getJokes(completionHandler: {(jokes) in
            for joke in jokes {
                self.jokesData.append(joke)
            }
            self.randomJoke()
            
        })
        
    }
    @IBAction func printJokeUIBtn(_ sender: UIButton) {
        self.randomJoke()
    }
    
    @IBAction func likeUIButton(_ sender: UIButton) {
        let voteCopy = self.votes
        print ("votecopy like => \(voteCopy)")
        if (self.random != nil) {
            if self.votes == 0 || self.votes == -1 {
                
                self.votes = 1
                print ("votecopy like => \(voteCopy)")
                if voteCopy != self.votes {
                    sender.isEnabled = false
                }
                
            } else {
                self.votes = self.votes + 1
                self.disableBtn(disableBtn: sender, enabledBtn: dislikeUIButton)
            }
            self.votesUILabel.text = ("\(self.votes)")
            self.labelRed()
            self.jokesRequest.updateVotes(value: self.jokesData[self.random!]["joke"] as? String ?? "", votes: self.votes)
            self.disableBtn(disableBtn: sender, enabledBtn: dislikeUIButton)
            
            dislikeUIButton.isEnabled = true
        }
    }
    @IBAction func dislikeUIButton(_ sender: UIButton) {
        let voteCopy = self.votes
        print ("votecopy dislike => \(voteCopy)")
        if (self.random != nil) {
            if self.votes == 0 || self.votes == 1 {
                self.votes = -1
                print ("votecopy dislike => \(voteCopy)")
                if voteCopy != self.votes {
                    sender.isEnabled = false
                }
                
            } else {
                self.disableBtn(disableBtn: sender, enabledBtn: likeUIButton)
                self.votes = self.votes - 1
            }
            
            self.votesUILabel.text = ("\(self.votes)")
            self.labelRed()
            self.jokesRequest.updateVotes(value: self.jokesData[self.random!]["joke"] as? String ?? "", votes: self.votes)
            self.disableBtn(disableBtn: sender, enabledBtn: likeUIButton)
            
            likeUIButton.isEnabled = true
        }
    }
    func randomJoke () {
        if self.jokesData.count > 0 {
            self.random = self.jokesData.indices.randomElement()
            if (self.random != nil) {
                self.joke = self.jokesData[self.random!]["joke"] as? String ?? ""
                self.votes = self.jokesData[self.random!]["votes"] as? Int ?? 0
                self.jokesUILabel.text = self.joke
                self.votesUILabel.text = ("\(self.votes)")
            }
            self.labelRed()
            likeUIButton.isEnabled = true
            dislikeUIButton.isEnabled = true
        }
    }
    func labelRed (){
        if self.votes < 0 {
            self.votesUILabel.textColor = self.dislikeUIButton.tintColor
        }
        else {
            self.votesUILabel.textColor = self.likeUIButton.tintColor
        }
    }
    func disableBtn (disableBtn: UIButton, enabledBtn: UIButton){
        if enabledBtn.isEnabled {
            disableBtn.isEnabled = false
        }
    }
}

