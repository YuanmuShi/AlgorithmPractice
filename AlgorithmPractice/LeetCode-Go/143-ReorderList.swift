//
//  143-ReorderList.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/3/25.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 143. 重排链表
 给定一个单链表 L：L0→L1→…→Ln-1→Ln ，
 将其重新排列后变为： L0→Ln→L1→Ln-1→L2→Ln-2→…

 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。

 示例 1:

 给定链表 1->2->3->4, 重新排列为 1->4->2->3.
 示例 2:

 给定链表 1->2->3->4->5, 重新排列为 1->5->2->4->3.

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reorder-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test143() {
    let head = List.createList([1,2,3])
    reorderList(head)
    print(head!.description)
  }
  
  private static func reorderList(_ head: ListNode?) {
    guard head?.next != nil else { return }
    
    var queue: [ListNode] = []
    var node = head
    while let n = node {
      queue.append(n)
      node = node?.next
    }
    
    var i = 0
    var j = queue.count - 1
    
    while i + 1 < j {
      let first = queue[i]
      let last = queue[j]
      first.next = last
      last.next =  queue[i + 1]
      queue[j - 1].next = nil
      
      i += 1
      j -= 1
    }
  }
}
