//
//  25-ReverseKGroup.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/10.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 25. K 个一组翻转链表
 给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。

 k 是一个正整数，它的值小于或等于链表的长度。

 如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。

  

 示例：

 给你这个链表：1->2->3->4->5

 当 k = 2 时，应当返回: 2->1->4->3->5

 当 k = 3 时，应当返回: 3->2->1->4->5

  

 说明：

 你的算法只能使用常数的额外空间。
 你不能只是单纯的改变节点内部的值，而是需要实际进行节点交换。
 */

extension Solution {
  static func test25() {
    let head = List.createList([1, 2, 3, 4, 5])
    List.showListContent(with: head, preText: "Original List")
    let resNode = Self.reverseKGroup(head, 3)
    List.showListContent(with: resNode, preText: "Result List")
  }
  
  private static func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard head?.next != nil, k > 1 else {
      return head
    }
    /// TODO: Need to do
    return nil
  }
}
