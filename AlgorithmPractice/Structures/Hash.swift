//
//  Hash.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2020/7/22.
//  Copyright © 2020 Jeffrey. All rights reserved.
//

import Foundation

extension Solution {
  // s = "anagram", t = "nagaram"
  static func isAnagram(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }
    if s.isEmpty { return true }
    var sMap = [Character: Int]()
    
    _ = s.map {
      if let count = sMap[$0] {
        sMap[$0] = count + 1
      } else {
        sMap[$0] = 1
      }
    }
    
    for char in t {
      guard let count = sMap[char], count > 0 else {
        return false
      }
      sMap[char] = count - 1
    }
    
    return true
  }
  
  // nums = [2, 7, 11, 15], target = 9
  static func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    guard !nums.isEmpty else { return [Int]() }
    
    /* 做了两次循环，并且还需判断 index 是否一致，且内存消耗多
     var map = [Int: Int]()
     for i in 0..<nums.count {
       map[target - nums[i]] = i
     }

     for i in 0..<nums.count {
       let value = nums[i]
       if let index = map[value], index != i {
         return [i, index]
       }
     }

     return [Int]()
     */
    var map = [Int: Int]()
    for (index, num) in nums.enumerated() {
      let minus = target - num
      
      if let index2 = map[minus] {
        return [index, index2]
      }
      
      map[num] = index
    }
    return []
  }
}
