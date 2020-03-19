//
//  LocalStore.swift
//  vJokes
//
//  Created by Patrick Iradukunda on 3/3/20.
//  Copyright © 2020 pat. All rights reserved.
//

import UIKit
class LocalStore {
   
  static var valueMap = [String: Codable]()
   
  static func setItem<T: Codable>(item: T?, key: String) {
    do {
      UserDefaults.standard.set(try PropertyListEncoder().encode(item), forKey: key)
      valueMap[key] = item
    } catch let error {
      print (error)
    }
  }
   
  static func get<T: Codable>(type: T.Type, key: String) -> T? {
    if let item = valueMap[key] as? T {
      return item
    } else {
      do {
        let storedObject = UserDefaults.standard.object(forKey: key) as? Data
        if let storedObject = storedObject {
          let result: T = try PropertyListDecoder().decode(T.self, from: storedObject)
          valueMap[key] = result
          return result
        }
      } catch let error {
        print (error)
      }
    }
    return nil
  }
   
  static func deleteItem(key: String) {
    UserDefaults.standard.removeObject(forKey: key)
    valueMap[key] = nil
  }
   
}

