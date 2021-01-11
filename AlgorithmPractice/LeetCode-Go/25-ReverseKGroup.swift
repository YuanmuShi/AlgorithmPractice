//
//  25-ReverseKGroup.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/10.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

extension Solution {
  static func test25() {
    let head = List.createList([1, 2, 3, 4, 5])
    List.showListContent(with: head, preText: "Original List")
    let resNode = Self.reverseKGroup(head, 3)
    List.showListContent(with: resNode, preText: "Result List")
  }
  
  private static func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard head?.next != nil, k > 1 else {
      return head
    }
    /// TODO: Need to do
    return nil
  }
}
