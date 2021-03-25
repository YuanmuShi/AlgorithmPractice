//
//  82-RemoveDuplicatesFromSortedListII.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/3/25.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 82. 删除排序链表中的重复元素 II
 存在一个按升序排列的链表，给你这个链表的头节点 head ，请你删除链表中所有存在数字重复情况的节点，只保留原始链表中 没有重复出现 的数字。

 返回同样按升序排列的结果链表。

 示例 1：
 输入：head = [1,2,3,3,4,4,5]
 输出：[1,2,5]
 
 示例 2：
 输入：head = [1,1,1,2,3]
 输出：[2,3]
  
 提示：
 链表中节点数目在范围 [0, 300] 内
 -100 <= Node.val <= 100
 题目数据保证链表已经按升序排列

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test82() {
//    let head = List.createList([1,2,3,3,4,4,5])
//    let head = List.createList([1,1,1,2,3])
//    let head = List.createList([1,1,1,2,2])
    let head = List.createList([1, 2])
    
    if let res = deleteDuplicates(head) {
      print(res)
    }
    print("Finished")
  }
  
  private static func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    guard head?.next != nil else { return head }
    
    var pre: ListNode? = ListNode(0, head)
    var current = head
    let newHead = pre
    
    while current != nil {
      var hasDuplicate = false
      while let val1 = current?.val, let val2 = current?.next?.val, val1 == val2 {
        current = current?.next
        hasDuplicate = true
      }
      current = current?.next
      
      if hasDuplicate {
        pre?.next = current
      } else {
        pre = pre?.next
      }
    }
    return newHead?.next
  }
}
