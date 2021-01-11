//
//  20-IsValid.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/11.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

extension Solution {
  static func test20() {
    print("Test 20 result: \(Self.isValid("({[)"))")
  }
  
  private static func isValid(_ s: String) -> Bool {
    guard !s.isEmpty else {
      return false
    }
    
    var containers: [Character] = []
    
    let pairs: [Character: Character] = [")": "(", "}": "{", "]": "["]
    
    s.forEach { char in
      if pairs.keys.contains(char),
         let pair = pairs[char],
         pair == containers.last {
        containers = containers.dropLast()
      } else {
        containers.append(char)
      }
    }
    
    return containers.isEmpty
  }
}
