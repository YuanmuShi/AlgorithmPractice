//
//  92-ReverseLinkedListII.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/2/10.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 92. 反转链表 II
 反转从位置 m 到 n 的链表。请使用一趟扫描完成反转。

 说明:
 1 ≤ m ≤ n ≤ 链表长度。

 示例:

 输入: 1->2->3->4->5->NULL, m = 2, n = 4
 输出: 1->4->3->2->5->NULL

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-linked-list-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
extension Solution {
  static func test92() {
    let head = List.createList([1, 2, 3])
    print(reverseBetween(head, 2, 3)!)
  }
  
  private static func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
    guard head != nil, head?.next != nil, m < n else { return head }
    
    var preNode: ListNode?
    var trailHead: ListNode?
    var currentNode = head
    var index = 0
    
    while index < m - 1 {
      preNode = currentNode
      currentNode = currentNode?.next
      index += 1
    }
    
    var subPreNode: ListNode?
    let subHead: ListNode? = currentNode
    while index < n {
      let tmpNode = currentNode?.next
      currentNode?.next = subPreNode
      subPreNode = currentNode
      currentNode = tmpNode
      index += 1
    }
    
    trailHead = currentNode
    
    let tmp = preNode?.next ?? subHead
    preNode?.next = subPreNode
    tmp?.next = trailHead
    
    return preNode == nil ? subPreNode : head
  }
}
