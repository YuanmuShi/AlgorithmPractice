//
//  141-HasCycle.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/10.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

extension Solution {
  static func test141() {
    let head = List.createList([1, 2, 3, 4, 5], cycleNodeValue: 4)
    List.showListContent(with: head, preText: "Original List")
    let result = Self.hasCycle(head)
    print("List Has Cycle: \(result)")
  }
  
  private static func hasCycle(_ head: ListNode?) -> Bool {
    guard head != nil else {
      return false
    }
    
    var slowNode = head
    var fastNode = head?.next
    
    while fastNode != nil {
      if fastNode?.val == slowNode?.val {
        return true
      }
      fastNode = fastNode?.next?.next
      slowNode = slowNode?.next
    }
    
    return false
  }
}
