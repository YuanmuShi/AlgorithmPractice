//
//  21-MergeTwoSortedLists.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/3/22.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 21. 合并两个有序链表
 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

 示例 1：
 输入：l1 = [1,2,4], l2 = [1,3,4]
 输出：[1,1,2,3,4,4]
 示例 2：

 输入：l1 = [], l2 = []
 输出：[]

 示例 3：
 输入：l1 = [], l2 = [0]
 输出：[0]

 提示：

 两个链表的节点数目范围是 [0, 50]
 -100 <= Node.val <= 100
 l1 和 l2 均按 非递减顺序 排列

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/merge-two-sorted-lists
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test21() {
    let list1 = List.createList([1, 2, 4, 6, 8])
    let list2 = List.createList([1, 3, 4])

    if let result = mergeTwoLists(list1, list2) {
      print(result)
    }
    print("Finished")
  }

  private static func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var list1 = l1
    var list2 = l2

    let preHead = ListNode(-1)
    var trailNode: ListNode? = preHead

    while list1 != nil, list2 != nil {
      if list1!.val < list2!.val {
        trailNode?.next = list1
        list1 = list1?.next
      } else {
        trailNode?.next = list2
        list2 = list2?.next
      }
      trailNode = trailNode?.next
    }

    trailNode?.next = list1 != nil ? list1 : list2

    return preHead.next
  }
}
