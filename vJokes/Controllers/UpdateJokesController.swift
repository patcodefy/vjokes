//
//  UpdateJokesController.swift
//  vJokes
//
//  Created by Patrick Iradukunda on 3/3/20.
//  Copyright © 2020 pat. All rights reserved.
//

import UIKit
class UpdateJokesController {
    internal let jokes = Jokes(fileName: "JokesData", fileType: "json")
    //internal lazy var jokesArray:[Joke] = jokes.getJokes()
    func addJoke (joke:Joke) {
        jokes.updateJokes(newJoke: joke)
    }
    func addUpVote (index:Int) {
           
    }
    func addDownVote (index:Int) {
           
    }
    func reportJoke (index:Int) {
           
    }
    func shareJoke (index:Int) {
           
    }
}
