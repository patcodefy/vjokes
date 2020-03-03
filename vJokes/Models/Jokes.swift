//
//  Jokes.swift
//  vJokes
//
//  Created by pat on 2/22/20.
//  Copyright © 2020 pat. All rights reserved.
//

import UIKit

class Jokes:Codable {
    let fileName: String
    let fileType: String
    init(fileName: String, fileType: String) {
        self.fileName = fileName
        self.fileType = fileType
    }
    func getJokes () -> [Joke]{
        return LocalStore.get(type: [Joke].self, key: "jokes") ?? []
    }
    func updateJokes(newJoke:Joke) {
        var jokes = getJokes()
        jokes.append(newJoke)
        LocalStore.setItem(item: jokes, key: "jokes")
    }
   
}
