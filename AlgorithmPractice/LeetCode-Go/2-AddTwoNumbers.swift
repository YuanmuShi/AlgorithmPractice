//
//  2-AddTwoNumbers.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/2/7.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 2. 两数相加
 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。

 请你将两个数相加，并以相同形式返回一个表示和的链表。

 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。

 示例 1：

 输入：l1 = [2,4,3], l2 = [5,6,4]
 输出：[7,0,8]
 解释：342 + 465 = 807.
 示例 2：

 输入：l1 = [0], l2 = [0]
 输出：[0]
 示例 3：

 输入：l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 输出：[8,9,9,9,0,0,0,1]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/add-two-numbers
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test2() {
    let l1 = List.createList([2, 4, 3])
    let l2 = List.createList([5, 6])
//
//    let l1 = List.createList([2,4,9])
//    let l2 = List.createList([5,6,4,9])
    print(addTwoNumbers(l1, l2)!)
  }

  private static func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    guard let list1 = l1, let list2 = l2 else { return l1 ?? l2 }

    var p1: ListNode? = list1
    var p2: ListNode? = list2
    // 进位
    var addtional = 0
    
    let result = list1
    var current: ListNode?
    
    while p1 != nil || p2 != nil {
      current = p1 ?? p2
      
      let v1 = p1?.val ?? 0
      let v2 = p2?.val ?? 0

      let tmp = (v1 + v2 + addtional) / 10
      current?.val = (v1 + v2 + addtional) % 10
      addtional = tmp

      p1 = p1?.next
      p2 = p2?.next
      current?.next = p1 ?? p2
    }

    if addtional != 0 {
      current?.next = ListNode(addtional)
    }

    return result
  }
}
