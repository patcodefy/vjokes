//
//  Jokes.swift
//  vJokes
//
//  Created by pat on 2/22/20.
//  Copyright © 2020 pat. All rights reserved.
//

import UIKit

class Jokes:Codable {
    
     func getJokes () -> [Any]{
        var jokesArray = [Any] ()
        if let jokesFilePath = Bundle.main.path(forResource: "JokesData", ofType: "json") {
            let url = URL(fileURLWithPath: jokesFilePath)
            do {
                let jokesData = try Data(contentsOf: url)
                jokesArray = try (JSONSerialization.jsonObject(with: jokesData, options: .mutableContainers) as? [Any] ?? [])
                } catch {
                print (error)
            }
        }
        return jokesArray
    }
   
}
