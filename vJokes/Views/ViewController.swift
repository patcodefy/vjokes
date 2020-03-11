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
    let jokesRequest = Jokes()
    var jokesData : [[String: Any]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        jokesRequest.getJokes(completionHandler: {(jokes) in
            self.jokesUILabel.text = jokes.randomElement()?["joke"] as? String
            for joke in jokes {
                self.jokesData.append(joke)
            }
        })
    }
    @IBAction func printJokeUIBtn(_ sender: UIButton) {
        if let random = randomJoke() {
            self.jokesUILabel.text = random["joke"] as? String ?? ""
            self.votesUILabel.text = ("\(random["votes"] as? Int ?? 0)")
        }
    }
    
    func randomJoke () -> [String:Any]? {
        var randomJoke:[String:Any]? = [:]
        if self.jokesData.count < 0 {
            return randomJoke
        }
        randomJoke = [
        "joke": self.jokesData.randomElement()?["joke"] as Any,
        "votes": self.jokesData.randomElement()?["votes"] as Any
        ] as [String : Any]
        return randomJoke
    }
   
    
    // This func will be used when I add feature to submit jokes
//    func addJokes() {
//        jokesRequest.writeJokes(jokeData: [
//            "joke": "",
//            "votes": 0,
//            "hide": false
//        ])
//    }
}

