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
//    let head = List.createList([1, 2, 3, 4, 5])
    let head = List.createList([1, 2, 3])
    print(reverseBetween(head, 1, 2)!)
  }
  
  // 3.18 每日一题温故
  private static func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
    guard head?.next != nil, n > m else { return head }
    
    var currentNode = head
    var preNode: ListNode?
    
    // 寻找到第 m 个点，作为开始节点，并记录 preNode
    var steps = 1
    while steps < m {
      steps += 1
      preNode = currentNode
      currentNode = currentNode?.next
    }
    
    var subPre: ListNode?
    // 子链表的第一个节点为反转后的子链表尾结点
    let subTrail = currentNode
    // 从第 m 个点开始到第 n 个结束，进行单链表反转，反转结束，则 current 指向的是第 n + 1 个点
    while steps <= n {
      steps += 1
      let nextNode = currentNode?.next
      currentNode?.next = subPre
      subPre = currentNode
      currentNode = nextNode
    }
    
    // 子链表反转结束，将 preNode 指向反转后的 head 节点，反转后的 尾结点指向 剩余部分节点
    preNode?.next = subPre
    subTrail?.next = currentNode
    // preNode 为空，说明反转的子链表是从第一个节点开始的，则子链表的 head 就是新链表的 head
    return preNode == nil ? subPre : head
  }
  
  private static func reverseBetween1(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
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
