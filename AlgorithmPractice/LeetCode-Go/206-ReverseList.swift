//
//  206-ReverseList.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/10.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

/*
 206. 反转链表
 反转一个单链表。

 示例:

 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL
 进阶:
 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？
 */

extension Solution {
  static func test206() {
    let head = List.createList([1, 2, 3, 4, 5])
    List.showListContent(with: head, preText: "Original List")
    let resNode = Self.reverseList(head)
    List.showListContent(with: resNode, preText: "Result List")
  }
  
  private static func reverseList(_ head: ListNode?) -> ListNode? {
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
