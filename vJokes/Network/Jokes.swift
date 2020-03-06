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

class Jokes{
    let collection = "jokes"
    let db = Firestore.firestore()
    
    func writeJokes (jokeData: [String:Any]){
        var ref: DocumentReference? = nil
        ref = db.collection(self.collection).addDocument(data: jokeData)
        { err in
            if let err = err {
                print ("Error adding document: \(err)")
                return
            }
            print ("Document added with ID: \(ref!.documentID)")
        }
        
    }
    func getJokes (completionHandler: @escaping (_ jokes: [[String:Any]]) -> Void) {
        db.collection(self.collection).whereField("hide", isEqualTo: false)
            .getDocuments() {(querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    return
                }
                var jokesData: [[String: Any]] = []
                for document in querySnapshot!.documents {
                    jokesData.append(document.data())
                }
                completionHandler(jokesData)
        }
        
    }
}
