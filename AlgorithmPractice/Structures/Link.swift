//
//  Link.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2020/7/20.
//  Copyright © 2020 Jeffrey. All rights reserved.
//

import Foundation

public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int) {
    self.val = val
    self.next = nil
  }
}

public class List {}

extension List {
  static func createList(_ list: [Int]) -> ListNode? {
    guard !list.isEmpty else { return nil }
    
    var head: ListNode?
    var preNode: ListNode?
    
    for value in list {
      let node = ListNode(value)
      if head == nil {
        head = node
      }
      
      preNode?.next = node
      preNode = node
    }
    
    return head
  }
  
  static func showListContent(with head: ListNode?) {
    guard head != nil else {
      print("Empty List")
      return
    }
    var elements: [Int] = []
    var node = head
    while node != nil {
      elements.append(node!.val)
      node = node?.next
    }
    print("List content: \(elements)")
  }
}

extension Solution {
  static func middleNode(_ head: ListNode?) -> ListNode? {
    guard head != nil, head?.next != nil else { return head }
    
    var slowNode = head
    var fastNode = head
    
    while fastNode != nil, fastNode?.next != nil {
      slowNode = slowNode?.next
      fastNode = fastNode?.next?.next
    }
    
    return slowNode
  }
  
  func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    guard head != nil, n > 0 else { return head }
    
    var slowNode = head
    var fastNode = head
    var fadeHead = head
    
    var index = n - 1
    while index > 0, fastNode != nil {
      fastNode = fastNode?.next
      index -= 1
    }
    
    while fastNode?.next != nil {
      slowNode = slowNode?.next
      fastNode = fastNode?.next
    }
    
    if slowNode?.next == nil {
      fadeHead = nil
    } else if slowNode === head {
      fadeHead = fadeHead?.next
    } else {
      slowNode?.val = slowNode!.next!.val
      slowNode?.next = slowNode?.next?.next
    }
    return fadeHead
  }
}
