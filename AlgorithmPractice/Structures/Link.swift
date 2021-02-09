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

extension ListNode: CustomStringConvertible {
  public var description: String {
    var des = ""
    
    var p: ListNode? = self
    while p?.next != nil {
      des += "\(p?.val ?? 0) -> "
      p = p?.next
    }
    
    des += "\(p?.val ?? 0)"
    return des
  }
}

public class List {}

extension List {
  static func createList(_ list: [Int], cycleNodeValue: Int? = nil) -> ListNode? {
    guard !list.isEmpty else { return nil }
    
    var head: ListNode?
    var preNode: ListNode?
    var cycleNode: ListNode?
    let lastNodeValue = list.last
    
    for value in list {
      let node = ListNode(value)
      if head == nil {
        head = node
      }
      
      preNode?.next = node
      preNode = node
      
      if value == cycleNodeValue {
        cycleNode = node
      }
      
      if cycleNode != nil,
         let val = lastNodeValue,
         value == val {
        node.next = cycleNode
      }
    }
    
    return head
  }
  
  static func showListContent(with head: ListNode?, preText: String = "List content") {
    guard head != nil else {
      print("Empty List")
      return
    }
    
    var elements: [Int] = []
    var node = head
    var cycleValue: Int?
    
    while node != nil {
      if elements.contains(node!.val) {
        cycleValue = node?.val
        break
      }
      elements.append(node!.val)
      node = node?.next
    }
    if let cycleValue = cycleValue {
      print("\(preText): \(elements), cycle node value: \(cycleValue)")
    } else {
      print("\(preText): \(elements)")
    }
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
