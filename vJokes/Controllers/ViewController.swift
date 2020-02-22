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
    let jokes = Jokes ()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()        
    }
    @objc func displayNewJoke(_ sender:UITapGestureRecognizer) {
        jokesUILabel.text = getJoke()
    }
    
    func newJokeTap(){
        let newJoke = UITapGestureRecognizer(target: self, action: #selector(self.displayNewJoke(_:)))
        self.jokesUILabel.isUserInteractionEnabled = true
        self.jokesUILabel.addGestureRecognizer(newJoke)
    }
    func getJoke() -> String{
        let jokes = [
            "Joke A",
            "Joke B"
        ]
        return jokes[1]
    }

}

