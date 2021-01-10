//
//  24-SwapPairs.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/10.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

extension Solution {
  static func test24() {
    let head = List.createList([1, 2, 3, 4, 5])
    List.showListContent(with: head, preText: "Test 24 Original List")
    let resNode = Self.swapPairs(head)
    List.showListContent(with: resNode, preText: "Test 24 Result List")
  }
  
  private static func swapPairs(_ head: ListNode?) -> ListNode? {
    guard head?.next != nil else {
      return head
    }
    
    let newHead = head?.next
    
    var fastNode = head?.next
    var slowNode = head
    var pre: ListNode?
    
    while fastNode != nil, slowNode != nil {
      let tmpNode = fastNode?.next
      pre?.next = fastNode
      pre = slowNode
      fastNode?.next = slowNode
      slowNode?.next = tmpNode
      slowNode = tmpNode
      fastNode = tmpNode?.next
    }
    
    return newHead
  }
}
