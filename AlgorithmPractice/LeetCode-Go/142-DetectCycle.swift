//
//  142-DetectCycle.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/10.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

extension Solution {
  static func test142() {
    let head = List.createList([1, 2, 3, 4, 5, 6, 7], cycleNodeValue: 3)
    List.showListContent(with: head, preText: "Original List")
    let result = Self.detectCycle(head)
    print("Cycle Node: \(String(describing: result?.val))")
  }
  
  private static func detectCycle(_ head: ListNode?) -> ListNode? {
    guard head != nil else {
      return nil
    }
    
    var slowNode = head
    var fastNode = head
    
    repeat {
      fastNode = fastNode?.next?.next
      slowNode = slowNode?.next
      if fastNode === slowNode {
        break
      }
    } while fastNode != nil
    
    if fastNode == nil {
      return nil
    }
    
    fastNode = head
    
    while fastNode !== slowNode {
      fastNode = fastNode?.next
      slowNode = slowNode?.next
    }
    
    return fastNode
  }
}
