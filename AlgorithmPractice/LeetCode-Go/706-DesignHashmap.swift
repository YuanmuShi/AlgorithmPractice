//
//  706-DesignHashmap.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/3/14.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

extension Solution {
  static func test706(){
    let hashmap = MyHashMapWithSystem()
    
    hashmap.put(1, 1)
    hashmap.put(2, 2)
    
    print(hashmap.get(2))
    print(hashmap.get(3))
    
    hashmap.put(2, 1)
    print(hashmap.get(2))
    
    hashmap.remove(1)
    print(hashmap.get(1))
  }
  
}

class MyHashMapWithSystem {
  var hashmap: [Int: Int] = [:]
  init() {}

  func put(_ key: Int, _ value: Int) {
    hashmap[key] = value
  }

  func get(_ key: Int) -> Int {
    return hashmap[key] ?? -1
  }

  func remove(_ key: Int) {
    hashmap.removeValue(forKey: key)
  }
}
