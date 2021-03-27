//
//  61-RotateList.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/3/27.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 61. 旋转链表
 给你一个链表的头节点 head ，旋转链表，将链表每个节点向右移动 k 个位置。

 示例 1：
 输入：head = [1,2,3,4,5], k = 2
 输出：[4,5,1,2,3]
 
 示例 2：
 输入：head = [0,1,2], k = 4
 输出：[2,0,1]

 提示：

 链表中节点的数目在范围 [0, 500] 内
 -100 <= Node.val <= 100
 0 <= k <= 2 * 109

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/rotate-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test61() {
    let head = List.createList([1, 2, 3, 4, 5])
    
    if let res = rotateRight(head, 4) {
      print(res.description)
    }
    print("Finished")
  }
  
  private static func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard head?.next != nil else { return head }
  
    // 遍历得到链表长度
    var count = 1
    var trail = head
    while trail?.next != nil {
      trail = trail?.next
      count += 1
    }
    // 计算需要移动的步数
    var steps = k % count
    // 移动步数为长度的整数倍，则无需移动
    if steps == 0 {
      return head
    }
  
    // 将尾结点指向头结点形成环，到新尾结点的步数为 count - steps
    trail?.next = head
    steps = count - steps
    
    while steps > 0 {
      trail = trail?.next
      steps -= 1
    }
  
    let newHead = trail?.next
    trail?.next = nil
  
    return newHead
  }
}
