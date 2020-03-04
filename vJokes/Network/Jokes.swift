//
//  Jokes.swift
//  vJokes
//
//  Created by pat on 2/22/20.
//  Copyright © 2020 pat. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class Jokes:Codable {
    let fileName: String
    let fileType: String
    init(fileName: String, fileType: String) {
        self.fileName = fileName
        self.fileType = fileType
        
    }
    init (){
        self.fileName = ""
        self.fileType = ""
    }
    
    func writeJokes (author:String){
        let db = Firestore.firestore()
        var ref: DocumentReference? = nil
        ref = db.collection("jokes").document(author).collection("authorJokes").addDocument(data: [
            "joke":"added joke from iOS",
            "votes": 45
        ])
        { err in
            if let err = err {
                print ("Error adding document: \(err)")
            } else {
                print ("Document added with ID: \(ref!.documentID)")
            }
        }
        
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
