//
//  Joke.swift
//  vJokes
//
//  Created by pat on 2/21/20.
//  Copyright © 2020 pat. All rights reserved.
//

import UIKit

struct Joke: Codable {
    var joke: String
    var upVotes: Int
    var downVotes: Int
    var reports: Int
    var shares: Int
}
