//
//  19-RemoveNthNodeFromEndOfList.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/3/9.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 19. 删除链表的倒数第 N 个结点
 给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。

 进阶：你能尝试使用一趟扫描实现吗？

 示例 1：

 输入：head = [1,2,3,4,5], n = 2
 输出：[1,2,3,5]
 示例 2：

 输入：head = [1], n = 1
 输出：[]
 示例 3：

 输入：head = [1,2], n = 1
 输出：[1]

 提示：

 链表中结点的数目为 sz
 1 <= sz <= 30
 0 <= Node.val <= 100
 1 <= n <= sz

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test19() {
    let node = List.createList([1, 2, 3, 4, 5])
//    let node = List.createList([1, 2])
    print(removeNthFromEnd(node, 3)!)
  }

  private static func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    var fast: ListNode? = head
    var slow: ListNode? = head
    var preSlow: ListNode?

    // 倒数 n 个节点，只需要前进 n - 1 步
    // 例如 [1, 2, 3, 4, 5]，n = 4 则 fast 从 1 移动到 4 只需要 3 步
    var step = 1
    while step < n {
      fast = fast?.next
      step += 1
    }

    while fast?.next != nil {
      preSlow = slow
      slow = slow?.next
      fast = fast?.next
    }
    preSlow?.next = slow?.next
    return preSlow == nil ? head?.next : head
  }
}
