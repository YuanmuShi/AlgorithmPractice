//
//  341-FlattenNestedListIterator.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/3/23.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 341. 扁平化嵌套列表迭代器
 给你一个嵌套的整型列表。请你设计一个迭代器，使其能够遍历这个整型列表中的所有整数。

 列表中的每一项或者为一个整数，或者是另一个列表。其中列表的元素也可能是整数或是其他列表。

 示例 1:

 输入: [[1,1],2,[1,1]]
 输出: [1,1,2,1,1]
 解释: 通过重复调用 next 直到 hasNext 返回 false，next 返回的元素的顺序应该是: [1,1,2,1,1]。
 示例 2:

 输入: [1,[4,[6]]]
 输出: [1,4,6]
 解释: 通过重复调用 next 直到 hasNext 返回 false，next 返回的元素的顺序应该是: [1,4,6]。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/flatten-nested-list-iterator
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class NestedInteger {
  var val: Int?
  var nestedVal: [NestedInteger] = []

  // Return true if this NestedInteger holds a single integer, rather than a nested list.
  func isInteger() -> Bool {
    return val != nil
  }

  // Return the single integer that this NestedInteger holds, if it holds a single integer
  // The result is undefined if this NestedInteger holds a nested list
  func getInteger() -> Int {
    return val ?? 0
  }

  // Set this NestedInteger to hold a single integer.
  func setInteger(value: Int) {
    val = value
  }

  // Set this NestedInteger to hold a nested list and adds a nested integer to it.
  func add(elem: NestedInteger) {
    nestedVal.append(elem)
  }

  // Return the nested list that this NestedInteger holds, if it holds a nested list
  // The result is undefined if this NestedInteger holds a single integer
  func getList() -> [NestedInteger] {
    return nestedVal
  }
}

class NestedIterator {
  var stack: [([NestedInteger], Int)]
  init(_ nestedList: [NestedInteger]) {
    stack = [(nestedList, 0)]
  }

  func next() -> Int {
    _ = hasNext()
    let (nestedList, i) = stack.last!
    let lastIndex = stack.count - 1
    stack[lastIndex].1 += 1
    return nestedList[i].getInteger()
  }

  func hasNext() -> Bool {
    while !stack.isEmpty {
      let (nestedList, i) = stack.last!
      if i == nestedList.count {
        _ = stack.popLast()
      } else {
        let x = nestedList[i]
        if x.isInteger() {
          return true
        }
        let lastIndex = stack.count - 1
        stack[lastIndex].1 += 1
        stack.append((x.getList(), 0))
      }
    }
    return false
  }
}

extension Solution {
  static func test341() {}
}
