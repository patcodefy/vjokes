//
//  ViewController.swift
//  vJokes
//
//  Created by pat on 2/21/20.
//  Copyright © 2020 pat. All rights reserved.
//

import UIKit

class ViewController: UIViewController, JokeDelegate{
    
    
    var jokes:[Joke] = []
    var index:Int?
    let jokesRequest = Jokes(fileName: "JokesData", fileType: "json")
    @IBOutlet weak var jokesUILabel: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        jokes = jokesRequest.getJokes()
        //print (jokesRequest.getJokes())
        self.printJoke(index: 0)
        
    }
    
    func printJoke(index: Int) {
        jokesUILabel.text = self.randomJoke()
    }
    func randomJoke() -> String {
        print(jokes.count)
        return jokes[Int.random(in: 0 ... jokes.count-1)].joke
    }
    
    

}

