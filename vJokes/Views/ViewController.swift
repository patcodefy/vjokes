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
    let jokesController = JokesController ()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.jokesUILabel.text = self.jokesController.printRandomJoke()
        
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(displayJokeOnLabel))
        self.jokesUILabel.isUserInteractionEnabled = true
        self.jokesUILabel.addGestureRecognizer(labelTap)
    }
    
    @objc func displayJokeOnLabel () {
        self.jokesUILabel.text = self.jokesController.printRandomJoke()
    }
    
    
}

