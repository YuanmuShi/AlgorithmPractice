//
//  83-RemoveDuplicatesFromSortedList.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/2/18.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 83. 删除排序链表中的重复元素
 给定一个排序链表，删除所有重复的元素，使得每个元素只出现一次。

 示例 1:

 输入: 1->1->2
 输出: 1->2
 示例 2:

 输入: 1->1->2->3->3
 输出: 1->2->3

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test83() {
    let head = List.createList([1,1,2])
    if let res = deleteDuplicates(head) {
      print(res)
    }
    print("Finished")
  }

  
  private static func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    guard head?.next != nil else { return head }
    
    var node = head
    while node != nil {
      if node?.next?.val == node?.val {
        let tmp = node?.next
        node?.next = node?.next?.next
        tmp?.next = nil
      } else {
        node = node?.next
      }
    }
    
    return head
  }
  
  private static func deleteDuplicates1(_ head: ListNode?) -> ListNode? {
    guard head?.next != nil else { return head }

    var pre = head
    var next = pre?.next

    while pre != nil, next != nil {
      if pre?.val == next?.val {
        next = next?.next
        pre?.next = next
      } else {
        pre = next
        next = next?.next
      }
    }
    return head
  }
}
