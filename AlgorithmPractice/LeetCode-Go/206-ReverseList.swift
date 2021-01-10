//
//  206-ReverseList.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/10.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

extension Solution {
  static func test206() {
    let head = List.createList([1, 2, 3, 4, 5])
    List.showListContent(with: head, preText: "Original List")
    let resNode = Self.reverseList(head)
    List.showListContent(with: resNode, preText: "Result List")
  }
  
  static func reverseList(_ head: ListNode?) -> ListNode? {
    guard head?.next != nil else {
      return head
    }
    
    var preNode: ListNode?
    var currentNode = head
    
    while currentNode != nil {
      let tmpNode = currentNode?.next
      currentNode?.next = preNode
      preNode = currentNode
      currentNode = tmpNode
    }
    
    return preNode
  }
}
