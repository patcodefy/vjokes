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
        //self.randomColor()
        self.jokesUILabel.text = randomJoke()
    }
    
    func randomJoke () -> String {
        guard let randomJoke = self.jokesData.randomElement()?["joke"] as? String else {
            return " "
        }
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

