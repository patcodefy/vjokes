//
//  JokesController.swift
//  vJokes
//
//  Created by Patrick Iradukunda on 2/26/20.
//  Copyright © 2020 pat. All rights reserved.
//

import UIKit
class DisplayJokesController{
    internal let jokesRequest = Jokes(fileName: "JokesData", fileType: "json")
    internal var jokes: [Joke] {
        get {
            return jokesRequest.getJokes()
        }
    }
    internal var index = 0
    
    func printRandomJoke() -> String {
        self.index = Int.random(in: 0...jokes.count-1)
        return self.jokes[self.index].joke
    }
    func printShares () -> Int {
        return self.jokes[self.index].shares
    }
    func printUpVotes () -> Int {
        return self.jokes[self.index].upVotes
    }
    func printDownVotes () -> Int {
        return self.jokes[self.index].downVotes
    }
    func printReports () -> Int {
        return self.jokes[self.index].reports
    }
    
    
}
