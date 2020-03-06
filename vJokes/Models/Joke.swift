//
//  Joke.swift
//  vJokes
//
//  Created by pat on 2/21/20.
//  Copyright © 2020 pat. All rights reserved.
//

import UIKit

struct Joke{
    var joke: String
    var votes: Int
    var hide: Bool
    init(joke: String, votes: Int, hide: Bool) {
        self.joke = joke
        self.votes = votes
        self.hide = hide
    }
}
