//
//  23-MergeKDortedLists.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/3/22.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 23. 合并K个升序链表
 给你一个链表数组，每个链表都已经按升序排列。

 请你将所有链表合并到一个升序链表中，返回合并后的链表。

 示例 1：
 输入：lists = [[1,4,5],[1,3,4],[2,6]]
 输出：[1,1,2,3,4,4,5,6]
 解释：链表数组如下：
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 将它们合并到一个有序链表中得到。
 1->1->2->3->4->4->5->6

 示例 2：

 输入：lists = []
 输出：[]

 示例 3：

 输入：lists = [[]]
 输出：[]

 提示：

 k == lists.length
 0 <= k <= 10^4
 0 <= lists[i].length <= 500
 -10^4 <= lists[i][j] <= 10^4
 lists[i] 按 升序 排列
 lists[i].length 的总和不超过 10^4

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/merge-k-sorted-lists
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
extension Solution {
  static func test23() {
//    let originList: [[Int]] = [[1, 4, 5], [1, 3, 4], [2, 6]]
//    let originList: [[Int]] = [[-8, -7, -7, -5, 1, 1, 3, 4], [-2], [-10, -10, -7, 0, 1, 3], [2]]
    let originList: [[Int]] = [[-8, -7, -6, -3, -2, -2, 0, 3],
                               [-10, -6, -4, -4, -4, -2, -1, 4],
                               [-10, -9, -8, -8, -6],
                               [-10, 0, 4]]

//    let originList: [[Int]] = [[1, 4, 5]]
    var lists: [ListNode?] = []
    for list in originList {
      lists.append(List.createList(list))
    }

    if let result = mergeKLists(lists) {
      print(result)
    }
    print("Finished")
  }

  private static func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    // 21. 合并两个有序链表
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
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

    var newLists: [ListNode?] = lists
    var count = newLists.count

    while count > 1 {
      var tmpLists: [ListNode?] = []

      while newLists.count > 1 {
        tmpLists.append(mergeTwoLists(newLists[0], newLists[1]))
        newLists.removeFirst(2)
      }

      tmpLists.append(contentsOf: newLists)
      newLists = tmpLists
      count = newLists.count
    }

    return newLists.first ?? nil
  }

  // 使用 优先队列，LeetCode 显示超时
  private static func mergeKLists1(_ lists: [ListNode?]) -> ListNode? {
    let priorityQueue = PriorityQueue<ListNodeStatus>()

    for list in lists {
      if let head = list {
        priorityQueue.offer(ListNodeStatus(node: head))
      }
    }

    var newHead: ListNode?
    var trailNode: ListNode?

    while priorityQueue.peek() != nil {
      let status = priorityQueue.poll()
      if let next = status?.next {
        priorityQueue.offer(ListNodeStatus(node: next))
      }

      if newHead == nil {
        newHead = status?.node
        trailNode = status?.node
      } else {
        trailNode?.next = status?.node
        trailNode = trailNode?.next
      }
    }
    return newHead
  }
}

struct ListNodeStatus {
  let node: ListNode
  let next: ListNode?

  init(node: ListNode) {
    self.node = node
    next = node.next
  }
}

extension ListNodeStatus: Comparable {
  static func < (lhs: ListNodeStatus, rhs: ListNodeStatus) -> Bool {
    return lhs.node.val < rhs.node.val
  }

  static func <= (lhs: ListNodeStatus, rhs: ListNodeStatus) -> Bool {
    return lhs.node.val <= rhs.node.val
  }

  static func > (lhs: ListNodeStatus, rhs: ListNodeStatus) -> Bool {
    return lhs.node.val > rhs.node.val
  }

  static func >= (lhs: ListNodeStatus, rhs: ListNodeStatus) -> Bool {
    return lhs.node.val >= rhs.node.val
  }

  static func == (lhs: ListNodeStatus, rhs: ListNodeStatus) -> Bool {
    return lhs.node.val == rhs.node.val
  }
}
