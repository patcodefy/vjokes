//
//  JokeDelegate.swift
//  vJokes
//
//  Created by Patrick Iradukunda on 2/25/20.
//  Copyright © 2020 pat. All rights reserved.
//

import UIKit

protocol JokeDelegate {
    func printJoke (index:Int)
    func randomJoke () -> String
}
