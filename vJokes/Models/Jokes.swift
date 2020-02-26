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
        guard let filePath = Bundle.main.path(forResource: self.fileName, ofType: self.fileType) else {
            return [Joke]()
        }
        
        var jokesArray = [Joke]()
        let url = URL(fileURLWithPath: filePath)
        do {
            let jsonDecoder = JSONDecoder()
            let jokesData = try Data(contentsOf: url)
            jokesArray = try jsonDecoder.decode([Joke].self, from: jokesData)
            //print (jokesArray)
        } catch {
            print (error)
        }
            
        return jokesArray
    }
   
}
