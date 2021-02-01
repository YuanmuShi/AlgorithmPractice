//
//  24-SwapPairs.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/10.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

/*
 24. 两两交换链表中的节点
 给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。

 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。

  

 示例 1：


 输入：head = [1,2,3,4]
 输出：[2,1,4,3]
 示例 2：

 输入：head = []
 输出：[]
 示例 3：

 输入：head = [1]
 输出：[1]
  

 提示：

 链表中节点的数目在范围 [0, 100] 内
 0 <= Node.val <= 100
  

 进阶：你能在不修改链表节点值的情况下解决这个问题吗?（也就是说，仅修改节点本身。）
 */

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
